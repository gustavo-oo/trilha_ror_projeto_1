module Screen
    MAIN = 0
    PRODUCTS = 1
    SUBTOTAL = 2
    EXIT = 3

    MAIN_PAGE_OPTIONS = [
        { label: "Comprar", value: Screen::PRODUCTS },
        { label: "Sair", value: Screen::EXIT }
    ]
    
    PRODUCTS_PAGE_OPTIONS = [
        { label: "Notebook: R$ 4999,99", value: 4999.99 },
        { label: "Pendrive: R$ 50,50", value: 50.50 },
        { label: "Teclado Mecânico: R$ 500,45", value: 500.45 },
    ]
end

def select_list(text,options)
    options.each_with_index do |option, index|
        puts "[#{index + 1}] #{option[:label]}"
    end

    print "\n#{text}"
    
    selected_index = gets.chomp.to_i - 1
    selected_option = options[selected_index]

    return nil if selected_option.nil?

    next_page = selected_option[:value]
end

def main_page
    text = "Selecione a opção desejada: "
    next_page = select_list(text, Screen::MAIN_PAGE_OPTIONS)
end

def products_page
    text = "Selecione a opção desejada: "
    product_value = select_list(text, Screen::PRODUCTS_PAGE_OPTIONS)

    return 0 if product_value.nil?

    print "Digite a quantidade desejada: "
    quantity = gets.chomp.to_i
    price = product_value * quantity

    return price
end

def subtotal_page subtotal
    puts "Subtotal: R$#{subtotal.round(2)}\n"
    print "Digite 0 para voltar ao menu inicial: "
    digit = gets.chomp.to_i
    digit == 0 ? Screen::MAIN : Screen::SUBTOTAL
end

def exit_page
    puts "Até breve!!!"
end

def main
    subtotal = 0
    quit = false
    current_screen = Screen::MAIN

    until quit
        system("clear")

        case current_screen
        when Screen::MAIN
            current_screen = main_page
        when Screen::PRODUCTS
            price = products_page
            subtotal += price
            current_screen = Screen::SUBTOTAL
        when Screen::SUBTOTAL
            current_screen = subtotal_page subtotal
        when Screen::EXIT
            exit_page
            quit = true
        else
            break
        end
    end
end

main