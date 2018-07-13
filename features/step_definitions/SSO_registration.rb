Given(/^Открываю в браузере BANKEX$/) do
    @driver.get('https://profile-dev.bankexlab.com/')
    @driver.manage().window().maximize()
    sleep 2
end

Then(/^Открываю в браузере окно восстановления пароля$/) do
    @driver.get('https://sso-uat.bankexlab.com/password-reset/' + "#{$token}")
    @driver.manage().window().maximize()
end

When(/^Нажимаю "(.*)"$/) do |elm|
    el = @driver.find_element(xpath: "//*[contains(text(), '#{elm}')]")
    el if el && el.displayed?
    el.click
end

And(/^Ввожу "(.*)": "(.*)"$/) do |elm, elm2|
    el = @driver.find_element(xpath: "//input[@placeholder = '#{elm}']")
    el if el && el.displayed?
    if elm2 == "Рандомная почта"
        $rand_email = generate_random_en_string(7) + "@email.com"
        puts $rand_email.to_s
        el.send_keys $rand_email
    else
        el.send_keys elm2
        @driver.action.send_keys(:tab).perform
    end
end

And(/^Нажимаю подтверждение$/) do
    el = @driver.find_element(xpath: "//button[@type = 'submit']")
    el if el && el.displayed?
    el.click
    sleep 5
end

And(/^Принимаю соглашение на первом этапе$/) do
    @driver.switch_to.default_content()
    @driver.action.send_keys(:page_down).perform
    sleep 3
    el = @driver.find_element(css: "#isAgreement-generic-0")
    el if el && el.displayed?
    el.click
    # el2 = @driver.find_element(xpath: "//input[@id = 'euAgreement']")
    # el2 if el2 && el2.displayed?
    # el2.click
end

And(/^Принимаю соглашение на втором этапе$/) do
    @driver.action.send_keys(:page_down).perform
    @driver.action.send_keys(:page_down).perform
    el = @driver.find_element(css: "#isAgreement-EU-0")
    el if el && el.displayed?
    el.click
    el2 = @driver.find_element(css: "#isAgreement-EU-1")
    el2 if el2 && el2.displayed?
    el2.click
    el3 = @driver.find_element(css: "#isAgreement-EU-2")
    el3 if el3 && el3.displayed?
    el3.click
    el4 = @driver.find_element(css: "#isAgreement-EU-3")
    el4 if el4 && el4.displayed?
    el4.click
end

# And(/^Прохожу Captcha$/) do
#     elem = @driver.find_element(css: "#g-recaptcha > div > div > iframe")
#     @driver.switch_to.frame(elem)
#     el = @driver.find_element(xpath: "//div[@class = 'recaptcha-checkbox-checkmark']")
#     el if el && el.displayed?
#     el.click
#     sleep 100
# end

And(/^Нажимаю OK$/) do
    # @driver.switch_to.default_content()
    # el = @driver.find_element(xpath: "//button/span[text() = 'OK']")
    # el if el && el.displayed?
    # el.click
    driver.switch_to.alert.accept()
    sleep 10
end


And(/^Прохожу Captcha$/) do
    sleep 100
end


And(/^Нажимаю кнопку ОК$/) do
    el = @driver.find_element(xpath: "//button[@type = 'button']")
    el if el && el.displayed?
    el.click
end

And(/^Проверка ошибки "(.*)"$/) do |elm|
    if @driver.find_element(xpath: "//*[text() = '#{elm}']").displayed? == true
        puts "Ошибка видна"
        el = @driver.find_element(xpath: "//*[text() = '#{elm}']")
        if el.displayed?
        puts "Ошибка: #{elm}"

        else
        puts "Ошибки нет"
        end
        sleep 2
    else
        case elm
        when "test@test.com"
            puts "Правильный E-mail"
        when "test@t.es-t.com"
            puts "Правильный E-mail"
        else
            puts "Ошибка: Не правильный E-mail"
        end
    end
end

And(/^Проверка валидации "(.*)", "(.*)"$/) do |elm, elm2|
    el = @driver.find_element(xpath: "//input[@placeholder = '#{elm}']")
    el if el && el.displayed?
    el.send_keys elm
    @driver.action.send_keys(:tab).perform
    case elm
    when "test@test.com"
        if @driver.find_element(xpath: "//*[text() = '#{elm}']").displayed? == true
            puts "#{elm2}"
    when "Роль пользователя"
        find(:xpath, "//div/span[text() = '#{text}']")
    when "Заголовок вкладки"
        find(:xpath, "//div/h1[text() = '#{text}']")
    when "Заголовок области"
        find(:xpath, "//div/h2[text() = '#{text}']")
    when "Ссылку"
        find(:xpath, "//button/span[text() = '#{text}']")
    when "Ссылку2"
        find(:xpath, "(//button/span[text() = '#{text}'])[2]")    
    when "Строку для выбора"
        if text == " Оператор "
            find(:xpath, "//div/mat-option/span[text() = '#{text}']")  
        else
            find(:xpath, "//div/mat-option/span[contains(text(), '#{text}')]")
        end
   end
end

And(/^Очистить поле "(.*)" если требуется$/) do |elm|
    el = @driver.find_element(xpath: "//input[@placeholder = '#{elm}']")
    el.clear
end
Then(/^LK_Проверили адрес почты "(.*)"$/) do |el|
     case el
    when "kgfh@mail.ru"
        здесь твой код
    when "hfgfj@dhdj"
        здесь твой код
    when "ghfjfd"
        здесь твой код
    end
end