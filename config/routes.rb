Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/display_prod" => "products#index"
    get "/display_prod/:id" => "products#show"
    post "/display_prod" => "products#create"
    patch "/display_prod/:id" => "products#update"
    delete "/display_prod/:id" => "products#delete"
    post "/username_path" => "products#login"
    end
end
