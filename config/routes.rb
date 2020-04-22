Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # if you want to see the routes & helpers you have drawn out visit http://localhost:3000/rails/info/routes

  get("/questions", to: "questions#index")
  get("/questions/new", to: "questions#new", as: :new_question) #adding a `as: :new_question` option to the route will change the helper path name. This is to adhere to rails convention
  post("/questions", to: "questions#create")

  # creates a dynamic URL paremter called :id. we can access this dynamic id using params[:id]
  get("/questions/:id", to: "questions#show", as: :question)
  delete("/questions/:id", to: "questions#destroy")
  get("/questions/:id/edit", to: "questions#edit", as: :edit_question)
  patch("/questions/:id", to: "questions#update")
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
  # delete()
  # patch()
end
