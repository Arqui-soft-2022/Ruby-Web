
class RegisterController < ApplicationController
  #metodo para recibir los parametros y hacer la conexión con el api

  def registro
  end

  def registrarUser
    @username = params[:username]
    @password = params[:password]
    @email = params[:email]
    @name = params[:name]

    if validarDatos
      #hacer las peticion
      response = HTTParty.post("https://codeqr-generate.herokuapp.com/api/auth/register",
        body: { 
          username: @username, 
          password: @password,
          email: @email,
          name: @name,
        }.to_json,
        headers: { "Content-Type" => "application/json" })

        if response.code == 200        
          n = Libnotify.new do |notify|
            notify.summary    = "Registro realizado con exito!"
            notify.body       = "Ahora podras iniciar sesión!"
            notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
            notify.urgency    = :normal  # :low, :normal, :critical
            notify.append     = false       # default true - append onto existing notification
            notify.transient  = true        # default false - keep the notifications around after display
          end
            n.show!
            
            redirect_to "/"
        elsif response.code == 400 || response.code == 404
          n = Libnotify.new do |notify|
            notify.summary    = "Este usuario ya se encuentra registrado!"
            notify.body       = "Inicia sesión!"
            notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
            notify.urgency    = :normal  # :low, :normal, :critical
            notify.append     = false       # default true - append onto existing notification
            notify.transient  = true        # default false - keep the notifications around after display
          end
            n.show!
            
            redirect_to "/"
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
    else
      #devolver un error
      n = Libnotify.new do |notify|
        notify.summary    = "Error al llenar el formulario"
        notify.body       = "Por favor verifica los campos"
        notify.timeout    = 0.1         # 1.5 (s), 1000 (ms), "2", nil, false
        notify.urgency    = :normal  # :low, :normal, :critical
        notify.append     = false       # default true - append onto existing notification
        notify.transient  = true        # default false - keep the notifications around after display
      end
        n.show!
    end

  end

  def validarDatos
    if @username == "" || @password == "" || @email == "" || @name == ""
      return false
    else
      return true
    end
  end

end
