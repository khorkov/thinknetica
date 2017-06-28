class Menu

  def initialize
    clear
    main_menu
    register_instance
  end

  protected

  def print_menu
    puts 'Меню:'
    @menu_items.each_with_index do |(menu_item), index|
      puts "#{index} #{menu_item}"
    end
  end

  def method_name
    choice = gets.to_i
    @menu_items.values[choice]
  end

  def main_menu
    print_menu
    send(method_name)
    main_menu
  end

  def clear
    system 'clear'
  end
end
