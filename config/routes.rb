Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Our application is running on localhost:3000
  # Inside of this is where we define what resources we want available to users
  
  # URL: http://localhost:3000/path
  # HTTP Request are used to interact with our server. They're made up of a HTTP VERB and a PATH
  # VERB     PATH       CONTROLLER    PUBLIC METHOD
  # 👇          👇            👇         👇
  get("/hello_world", to: "welcome#hello_world") # when someone visits GET "/hello_world" they are sent to the welcome controller, hello_world action.

  # GET "/" WelcomeController.root method gets called
  get("/", to: "welcome#root")

  # GET "/contact_us"
  get("/contact_us", to: "welcome#contact_us")

  # POST "/process_contact"
  post("/process_contact", to: "welcome#process_contact")
end
