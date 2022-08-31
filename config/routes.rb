Rails.application.routes.draw do
  
  
  get 'register/registro'
  get '/listar_qr/listarQR', to: "listar_qr#home"
  get "generate_qr/createQR/user", to: "generate_qr#createQR"
  get "/create/:id", to: "generate_qr#createQR"
  get "/exportQR", to: "export_qr#export_QR", as:"exportQR"
  post 'register/registro/user', to:"register#registrarUser"
  post "login/user", to: "login#iniciar_sesion"

  root "login#home", as:"root"
end
