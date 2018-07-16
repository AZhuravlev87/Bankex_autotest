Then(/^Отправляю запрос для востановления пароля к почте "(.*)"$/) do |elm|
    body = "{
        \"captcha\":\"03ACgFB9uTM4r1BSeWGTt4b1x2Hsi0GU4sTTQNT-QV2QfNM7DILwQM0Y5utcgQIWSuFhZNSnMtGn2EjMBxsZXa7cAEBIyeTKRFHzhmkg-Vk3Ew7_8a7FRZxZOZp7MkNje3H_loE0oBz7ceopyKcs9EBQ7c9aYxg8mklX6b_joprBGA6TFjdVEszIDUQfJkEkHwOyI-G1gDpGK9i4nuoQET1CsiXA3eUfTabxbh6w1ej2zycljEb4H-i7_IdV10VKUzHHtPL6Cx_v_feGdkqeYzL-p1hdZV6iC_A9xmFisXEvHZfHALYOO3xJ-CRkFmrcjt9Bn64mJ3A7gDm065Ns2if3fcLKonIGypLUt4nRahlCL97GDGWbl5Pzo\",
        \"email\": \"#{elm}\",
        \"redirectUrl\": \"\"
    }"

    $response = HTTParty.post("https://sso-uat.bankexlab.com/api/v1/restorePassword", :body => body)

    puts $response.code.to_s
    puts $response.body.to_s

    $token = JSON.parse($response.body)["token"]
end

Then(/^Отправляю запрос для регистрации E-mail "(.*)" с ключем Capcha$/) do |elm|
    if elm == "Рандомная почта"
        elm2 = $rand_email
    else
        elm2 = elm
    end
    body = "{
        \"captcha\":\"03AEMEkEklSid3BJ5LVnizBun-6RunAaqxh0s6C-CXOqucg2HperF3VLpfdQjcdOXrmF9np5QbL-FLLlP_UYixu3GOOfIVn8IzsOAnXAFWUKx3nSNgtzY3W5nP5pEixrZmmeeXdqFYRSOn7knBHguiGEx6xl3ssK2xNu6HzQYd1hWH7lSFsdfh-a1C0dTmqNBzyrZoJMwCBIl678m-RvEY_eJMGSIKJWY_N2GraLS_FT82eTlzoZAXP2euN418m711RGZTj_ac-3TlMo8el5Z4_S1BkZU5SAxrhGd4Ho7QZ6VI1zJ7cpFOIoEuC9siFKNoFwvwOLxrHDVT0ssYxUzaoF4xAtx-tJ9Ax52VNGTwWmH8S2IG-42YjNE\",
        \"email\": \"#{elm2}\",
        \"redirectUrl\": \"https://profile-dev.bankexlab.com\",
        \"roles\": [\"CU_user\"]
    }"

    $response = HTTParty.post("https://sso-dev.bankexlab.com/api/v1/simple/signup", :body => body)

    puts $response.code.to_s
    puts $response.body.to_s

    $token = JSON.parse($response.body)["token"]
end