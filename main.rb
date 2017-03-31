require_relative 'reddit'
require_relative 'mashable'
require_relative 'digg'
require 'colorize'
require 'launchy'

class Main

  def initialize
    @page = 1
    @digg = Digg.new
    @mashable = Mashable.new
    @reddit = Reddit.new
    @sources = []
    @news = []
    @current_new = 0
    @max = 0
  end

  def load_news
    system('clear')
    puts "Cargando noticias..."
    @sources.each do |source|
      @news.push(source.create_items)
    end
    @news.flatten!
    @news.sort_by! { |item| item.date }.reverse!
  end

  def show_news
    system('clear')
    min = (@page*5)-5
    @max = (5*@page)-1
    if @max > @news.length-1
       @max = @news.length-1
       min = @max-4
    end
    for i in min..@max
      number = (i+1).to_s
      if @current_new == i
        number = number.on_blue
      end
      puts "########{number}#######"
      puts @news[i].title
      puts "Autor: #{@news[i].author}"
      #puts "Hora item.time"
      puts "Fecha: #{@news[i].date}"
      puts "link: #{@news[i].link}"
      puts
    end
  end

  def show_select
    system('clear')
    puts "
    [1] = Digg
    [2] = Mashable
    [3] = Reddit
    [0] = Todas las anteriores"
  end

  def update
    show_news
    show_bot
  end

  def menu
    done = false
    while !done
      update
      key = Etc.get_keypressed
      case key
      when 'x'
        done = true
      when 'd'
        @page +=1
        if @page > (@news.length + 4) / 5
          @page -= 1
        end
        @current_new = @page*5 - 5
      when 'a'
        @page -=1
        if @page <= 0
          @page = 1
        end
        @current_new = @page*5 - 5
      when 's'
        if @current_new < @max
          @current_new += 1
        end
      when 'w'
        if @current_new > @max - 4
          @current_new -= 1
        end
      when 'l'
        puts "Abriendo..."
        Launchy.open(@news[@current_new].link)
      end
    end
  end

  def show_bot
    puts
    puts "Pagina: #{@page}"
    puts "[w][a][s][d] Para moverte"
    puts "[l] abrir link"
    puts "[x] salir"
  end

  def get_user
    key = Etc.get_keypressed
    case key
    when '1'
      @sources.push(@digg)
    when '2'
      @sources.push(@mashable)
    when '3'
      @sources.push(@reddit)
    when '0'
      @sources.push(@digg, @mashable, @reddit)
    else
      get_user
    end
  end

  def init
    show_select
    get_user
    load_news
    menu
  end
end

main = Main.new
main.init
