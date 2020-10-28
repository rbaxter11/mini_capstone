Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/display_all_path" => "products#display_all"
    get "/display_prod1" => "products#display1"
    get "/display_prod2" => "products#display2"
    get "/display_prod3" => "products#display3"
  end
end
