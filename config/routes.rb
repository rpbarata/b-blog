# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "authors/registrations",
  }
  get "health", to: "health#health"
end
