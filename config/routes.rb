Rails.application.routes.draw do
  devise_for :users
  resources :studies
  resources :quizzes
  root 'pages#home'
  get "question", to: "questions#question"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
