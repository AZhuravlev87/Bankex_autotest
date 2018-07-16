@st

Feature: Тестирование регистрация SSO simple flow

#@1
#     Scenario: Регистрация положительный сценарий
#        Given Открываю в браузере BANKEX
#        When  Нажимаю "Sign Up"
#        And   Ввожу "E-Mail": "Рандомная почта"
#        And   Нажимаю подтверждение
#        And   Принимаю соглашение на первом этапе
#        And   Отправляю запрос для регистрации E-mail "Рандомная почта" с ключем Capcha

@2
     Scenario: Валидация полей страницы Sign Up
        Given Открываю в браузере BANKEX
        When  Нажимаю "Sign Up"
        And   Нажимаю подтверждение
        And   Проверка ошибки "Please, fill all fields correctly."
# написать проверки валидации ошибок


#@3
#    Scenario: Зайти в приложение
#        Given Открываю в браузере BANKEX
#        And   Ввожу "E-Mail": "Email@Email.email"
#        And   Ввожу "Password": "Qwerty1234"
#        And   Прохожу Captcha
#        And   Нажимаю подтверждение
#        When  Нажимаю "Log Out"

#@4
#    Scenario: Востановление пароля API
#        Given Открываю в браузере BANKEX
#        When  Нажимаю "Forgot password"
#        And   Отправляю запрос для востановления пароля к почте "Email@Email.email"
#        Then  Открываю в браузере окно восстановления пароля
#        And   Ввожу "New password": "Qwerty1234"
#        And   Ввожу "Confirm password": "Qwerty1234"
#        And   Нажимаю подтверждение