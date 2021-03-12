Rails.application.routes.draw do
  resources :studies
  resources :quizzes
  get 'pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
