Rails.application.routes.draw do
  get 'register/registro'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "login/user", to: "login#iniciar_sesion"
  root "login#home"
end
