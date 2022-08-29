require 'rest-client'
require 'json'

class LoginController < ApplicationController
  
  def home
    
  end

  def iniciar_sesion
    username = params[:username]
    password = params[:password]

    response = HTTParty.post("https://codeqr-generate.herokuapp.com/api/auth/login",
      body: { 
        username: username, 
        password: password,
      }.to_json,
      headers: { "Content-Type" => "application/json" })
      
      #LEER
      puts response
      puts "Se redigire a la pagina despues del logueo"
  end
end
