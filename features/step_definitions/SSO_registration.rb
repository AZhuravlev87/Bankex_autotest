Given(/^Открываю в браузере BANKEX DEV$/) do
    @driver.get($PROFILE_DEV)
    @driver.manage().window().maximize()
    sleep 2
end

Then(/^Открываю в браузере окно восстановления пароля$/) do
    @driver.get('https://sso-uat.bankexlab.com/password-reset/' + "#{$token}")
    @driver.manage().window().maximize()
end

When(/^Нажимаю "(.*)"$/) do |elm|
    sleep 2
    el = @driver.find_element(xpath: "//*[text() = '#{elm}']")
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



And(/^Очистить поле "(.*)" если требуется$/) do |elm|
    el = @driver.find_element(xpath: "//input[@placeholder = '#{elm}']")
    el.clear
end

And(/^Проверка ошибки "(.*)"$/) do |elm|
    @driver.find_element(:xpath, "//*[text() = '#{elm}']")
    
end

And(/^Проверка валидации E-mail правильный E-mail$/) do
    count = nil # обявляем переменную и говорим что она совсем пуста
        count = $email_true.size # сюда мы подставим то что взяли из массива (количество емейл)
        while count != 0 #ну и тут начинается цикл
            begin
                el = @driver.find_element(xpath: "//input[@placeholder = 'E-Mail']")
                el.click
                el.send_keys $email_true[count -1]
                @driver.action.send_keys(:tab).perform
                sleep 3
                if @driver.find_elements(xpath: "//*[text() = 'The input is not valid E-mail!']").count <= 0
                else
                    raise "Ошибка появилась!"
                end
                sleep 2
                el.clear
                count -= 1
                puts count
            rescue
                raise "Цикл не отработал"
            end
        end
        sleep 2
end

And(/^Проверка валидации E-mail не правильный E-mail$/) do
    count = nil # обявляем переменную и говорим что она совсем пуста
        count = $email_false.size # сюда мы подставим то что взяли из массива (количество емейл)
        while count != 0 #ну и тут начинается цикл
            begin
                el = @driver.find_element(xpath: "//input[@placeholder = 'E-Mail']")
                el.click
                el.send_keys $email_false[count -1]
                @driver.action.send_keys(:tab).perform
                sleep 3
                if @driver.find_elements(xpath: "//*[text() = 'The input is not valid E-mail!']").count > 0
                else
                    raise "Ошибка не появилась!"
                end
                el.clear
                count -= 1
                puts count
            rescue
                raise "Цикл не отработал"
            end
        end
        sleep 2
end

And(/^Проверка валидации E-mail разные символы$/) do
    count = nil # обявляем переменную и говорим что она совсем пуста
        count = $simbols.size # сюда мы подставим то что взяли из массива (количество емейл)
        while count != 0 #ну и тут начинается цикл
            begin
                el = @driver.find_element(xpath: "//input[@placeholder = 'E-Mail']")
                el.click
                el.send_keys "test@t.es" + $simbols[count -1] + "t.com"
                @driver.action.send_keys(:tab).perform
                sleep 2
                if @driver.find_elements(xpath: "//*[text() = 'The input is not valid E-mail!']").count > 0
                else
                    raise "Ошибка не появилась!"
                end
                el.clear
                count -= 1
                puts count
            rescue
                raise "Цикл не отработал"
            end
        end
        sleep 2
end

And(/^Ввод коректного E-mail$/) do
    el = @driver.find_element(xpath: "//input[@placeholder = 'E-Mail']")
    el.click
    el.send_keys "test@test.com"
end

And(/^Нажимаю кнопку Continue$/) do
    el = @driver.find_element(xpath: "//button[@class = 'ant-btn ant-btn-primary ant-btn-lg']")
    el if el && el.displayed?
    el.click
    sleep 3
end

And(/^Нажимаю кнопку Cancel$/) do
    el = @driver.find_element(xpath: "//a[text() = 'Cancel']")
    el if el && el.displayed?
    el.click
    sleep 2
end

And(/^Ошибка "(.*)" должна быть$/) do |elm|
    @driver.find_elements(:xpath, "//*[text() = '#{elm}']").count > 0
end
And(/^Ошибка "(.*)" не должно быть$/) do |elm|
    @driver.find_elements(:xpath, "//*[text() = '#{elm}']").count <= 0
end

And(/^Ожидание$/) do
    sleep 5
end

And(/^Пролистать вниз$/) do
    @driver.switch_to.default_content()
    @driver.action.send_keys(:page_down).perform
    sleep 3
end

And(/^Пролистать вверх$/) do
    @driver.switch_to.default_content()
    @driver.action.send_keys(:page_up).perform
    sleep 3
end