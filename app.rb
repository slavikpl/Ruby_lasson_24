#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/abaut' do
  @error = "Ошибка"
  erb :abaut
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  if @username == ""
    @error = "Введите имя!"
    return erb :visit
  end

  data = File.open './public/users.txt','a'
  data.write "Имя клиента: #{@username}, телефон: #{@phone}, дата и время: #{@datetime}, парикмахер: #{@barber}, цвет волос #{@color}\n"
  data.close
  erb "<h1>Отлично! Мы Вас ждем #{@username}!</h1>"
end

post '/contacts' do
  @email = params[:email]
  

  contact = File.open './public/contacts.txt','a'
  contact.write "Email #{@email}\n"
  contact.close

end




