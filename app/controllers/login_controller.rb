require 'rest-client'
require 'json'

class LoginController < ApplicationController
  
  def home
    #url johnny https://codeqr-generate-johnny.herokuapp.com/
      #url api https://codeqr-generate.herokuapp.com
    response = HTTParty.post("https://codeqr-generate2.herokuapp.com/api/auth/login",
      body: { 
        username: "prueba",
        password: "prueba",
      }.to_json,
      headers: { "Content-Type" => "application/json" })
      puts response.code
      if response.code != 400
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
    #url johnny https://codeqr-generate-johnny.herokuapp.com/
      #url api https://codeqr-generate.herokuapp.com
    response = HTTParty.post("https://codeqr-generate2.herokuapp.com/api/auth/login",
      body: { 
        username: username, 
        password: password,
      }.to_json,
      headers: { "Content-Type" => "application/json" })
      
      if response.code == 200 || response.code == 202
        n = Libnotify.new do |notify|
          notify.summary    = "Inicio de sesión correcto"
          notify.body       = "Disfruta de nuestra aplicación!"
          notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
          notify.urgency    = :normal  # :low, :normal, :critical
          notify.append     = false       # default true - append onto existing notification
          notify.transient  = true        # default false - keep the notifications around after display
        end
          n.show!
          cookies[:id] = response["usuario"]["id_usuario"]
        redirect_to "/generate_qr/createQR/user"
        elsif response.code == 400 || response.code == 404
          n = Libnotify.new do |notify|
            notify.summary    = "Datos incorrectos"
            notify.body       = "Por favor verifica los datos"
            notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
            notify.urgency    = :normal  # :low, :normal, :critical
            notify.append     = false       # default true - append onto existing notification
            notify.transient  = true        # default false - keep the notifications around after display
          end
            n.show!
        else
          n = Libnotify.new do |notify|
            notify.summary    = "Ha Ocurrido un error en el sistema"
            notify.body       = "Vuelve a intentarlo mas tarde"
            notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
            notify.urgency    = :critical  # :low, :normal, :critical
            notify.append     = false       # default true - append onto existing notification
            notify.transient  = true        # default false - keep the notifications around after display
          end
            n.show!
        end
  end
end