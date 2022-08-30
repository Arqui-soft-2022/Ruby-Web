require 'rest-client'
require 'json'

class LoginController < ApplicationController
  
  def home
    response = HTTParty.post("https://codeqr-generate.herokuapp.com/api/auth/login",
      body: { 
        username: "prueba",
        password: "prueba",
      }.to_json,
      headers: { "Content-Type" => "application/json" })
      puts response.code
      if response.code != 404
        n = Libnotify.new do |notify|
          notify.summary    = "Ha ocurrido un error en el sistema"
          notify.body       = "Vuelve a intentarlo mas tarde"
          notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
          notify.urgency    = :critical  # :low, :normal, :critical
          notify.append     = false       # default true - append onto existing notification
          notify.transient  = true        # default false - keep the notifications around after display
        end
          n.show!
      end
    
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
