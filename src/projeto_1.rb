module Screen
    MAIN = 0
    PRODUCTS = 1
    SUBTOTAL = 3
    EXIT = 4
end

def select_list options
    options.each_with_index do |option, index|
        puts "[#{index + 1}] #{option[:label]}"
    end

    selected_index = gets.chomp.to_i - 1
    selected_option = options[selected_index]
    selected_option[:value]
end

def title text
    puts "#{text}:\n\n"
end

def main_page
    next_page_options = [
        {
            label: "Comprar",
            value: Screen::PRODUCTS,
        },
        {
            label: "Sair",
            value: Screen::EXIT,
        }
    ]

    title "Selecione a opção desejada"
    select_list next_page_options
end

def products_page
    product_options = [
        {
            label: "Notebook: R$ 4999,99",
            value: 4999.99,
        },
        {
            label: "Pendrive: R$ 50,50",
            value: 50.50,
        },
        {
            label: "Teclado Mecânico: R$ 500,45",
            value: 500.45,
        },
    ]

    title "Selecione a opção desejada"
    product_value = select_list product_options

    title "Digite a quantidade desejada"
    quantity = gets.chomp.to_i
    return product_value * quantity
end

def subtotal_page subtotal
    digit = nil

    while digit != 0
        system("clear")
        puts "Subtotal: R$#{subtotal.round(2)}\n"
        print "Digite 0 para voltar ao menu inicial: "
        digit = gets.chomp.to_i
    end
end

def exit_page
    puts "Até breve!!!"
end


def run
    subtotal = 0
    quit = false
    current_screen = Screen::MAIN

    until quit
        system("clear")

        case current_screen
        when Screen::MAIN
            current_screen = main_page
        when Screen::PRODUCTS
            subtotal += products_page
            current_screen = Screen::SUBTOTAL
        when Screen::SUBTOTAL
            subtotal_page subtotal
            current_screen = Screen::MAIN
        when Screen::EXIT
            exit_page
            quit = true
        end
    end
end

run