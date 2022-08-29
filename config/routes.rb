Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'register/registro'
  post 'registro/user', to:"register#registro"
  post "login/user", to: "login#iniciar_sesion"

  root "login#home"
end
