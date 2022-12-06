# frozen_string_literal: true

Rails.application.routes.draw do
  get "home_page/index"
  devise_for :users, controllers: {
    registrations: "authors/registrations",
  }
  mount Avo::Engine, at: Avo.configuration.root_path
  get "health", to: "health#health"

  root "home_page#index"
end
