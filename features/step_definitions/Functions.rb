
def generate_random_en_string(len)
    raise ArgumentError, 'Parameter len is required' if len.nil?
    raise ArgumentError, 'Parameter len is not Integer' unless len.is_a? Integer
    range = ('a'..'z').to_a
    len_range = range.length - 1
    (len.times.map { range[rand(len_range)] }).join
end

=begin
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
=end