@st

Feature: Тестирование регистрация SSO simple flow

#@1
#     Scenario: Регистрация положительный сценарий
      # Задача: https://bankex.testrail.io/index.php?/cases/view/211&group_by=cases:section_id&group_order=asc&group_id=187
#        Given Открываю в браузере BANKEX DEV
#        When  Нажимаю "Sign Up"
#        And   Ввожу "E-Mail": "Рандомная почта"
#        And   Нажимаю подтверждение
#        And   Принимаю соглашение на первом этапе
         # Пройти капчу и завершить регистрацию.
#        And   Отправляю запрос для регистрации E-mail "Рандомная почта" с ключем Capcha

@2
     Scenario: Регистрация - Валидация полей страницы Sign Up
      # Задача: https://bankex.testrail.io/index.php?/cases/view/228&group_by=cases:section_id&group_order=asc&group_id=187
        Given Открываю в браузере BANKEX DEV
        When  Нажимаю " Sign Up "
        And   Нажимаю подтверждение
        And   Проверка ошибки "Please, fill all fields correctly."
        And   Проверка валидации E-mail правильный E-mail
        And   Проверка валидации E-mail не правильный E-mail
        And   Проверка валидации E-mail разные символы
        # Не отрабатывает "test" - проверить
        And   Ввод коректного E-mail
        And   Нажимаю кнопку Continue



#@3
#    Scenario: Регистрация - валидация полей страницы agreement
     # Задача: https://bankex.testrail.io/index.php?/cases/view/233&group_by=cases:section_id&group_order=asc&group_id=187
#        Given Открываю в браузере BANKEX DEV
#        When  Нажимаю " Sign Up "
#        And   Ввожу "E-Mail": "test2@test.com"
#        And   Нажимаю кнопку Continue
#        And   Пролистать вниз
#        And   Нажимаю подтверждение
#        And   Ошибка "Please accept agreement" должна быть
#        And   Ошибка "Please accept captcha" должна быть
#        And   Принимаю соглашение на первом этапе
#        And   Нажимаю подтверждение
#        And   Ошибка "Please accept captcha" должна быть   
#        And   Ошибка "Please accept agreement" не должно быть
#        Пройти капчу, нажать sign up в ошибке нажать ок

#@4
#    Scenario: Регистрация - пользователь уже зарегистрирован
    # Задача: https://bankex.testrail.io/index.php?/cases/view/230&group_by=cases:section_id&group_order=asc&group_id=187
#        Given Открываю в браузере BANKEX DEV
#        When  Нажимаю " Sign Up "
#        And   Ввожу "E-Mail": "rost69@gmail.com"
#        And   Нажимаю кнопку Continue
#        And   Пролистать вниз
 #       And   Нажимаю подтверждение
        # Нужна проверка ошибки  

#@5
#    Scenario: Регистрация - отмена регистрации
     # Задача: https://bankex.testrail.io/index.php?/cases/view/231&group_by=cases:section_id&group_order=asc&group_id=187
#        Given Открываю в браузере BANKEX DEV
#        When  Нажимаю " Sign Up "
#        And   Ввожу "E-Mail": "test1@test.com"
#        And   Нажимаю кнопку Continue
#        And   Пролистать вниз
#        And   Нажимаю кнопку Cancel
#        And   Пролистать вверх
#        And   Нажимаю " Sign Up "
#        And   Пролистать вверх
#        And   Ввожу "E-Mail": "test1@test.com"
#        And   Нажимаю кнопку Continue
#        And   Пролистать вниз
#        And   Принимаю соглашение на первом этапе
#        And   Нажимаю кнопку Cancel