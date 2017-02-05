Rails.application.routes.draw do
  devise_for :users

  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    root 'pages#index'
  end
  root 'pages#index'
end
