Rails.application.routes.draw do
  
  
  get 'register/registro'
  get 'listar_qr/listarQR'
  get "generate_qr/createQR/user/:id", to: "generate_qr#createQR"
  get "/create/:id", to: "generate_qr#createQR"
  post 'register/registro/user', to:"register#registrarUser"
  post "login/user", to: "login#iniciar_sesion"

  root "login#home", as:"root"
end
