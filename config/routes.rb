# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home_page/index'
  devise_for :users, controllers: {
    registrations: "authors/registrations",
  }
  get "health", to: "health#health"

  root "home_page#index"
end
