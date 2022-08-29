class RegisterController < ApplicationController
  #metodo para recibir los parametros y hacer la conexión con el api

  def registro
  end

  def registrarUser
    username = params[:username]
    password = params[:password]
    email = params[:email]
    name = params[:name]
    
  end

end
