Refactor::Application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: 'about'
end