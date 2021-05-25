

class Alert
    include Capybara:: DSL #include para usar recursos do Capybara

    def dark
        return find(".alert-dark").text
    end

end