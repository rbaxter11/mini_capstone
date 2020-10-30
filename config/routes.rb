Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/display_all_path" => "products#display_all"
    get "/display_prod1" => "products#display1"
    get "/display_prod2" => "products#display2"
    get "/display_prod3" => "products#display3"
    get "/display_query_path" => "products#display_query_action"
    get "/display_url_path/:variable" => "products#display_url_action"
    post "/display_body_path" => "products#display_body_action"
    post "/username_path" => "products#login"
    end
end
