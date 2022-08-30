Rails.application.routes.draw do
  get 'generate_qr/createQR'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'register/registro'
  get 'listar_qr/listarQR'
  get "generate_qr/createQR"
  post 'register/registro/user', to:"register#registrarUser"
  post "login/user", to: "login#iniciar_sesion"

  root "login#home"
end
