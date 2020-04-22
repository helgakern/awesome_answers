We'll start around 9:10.
Make sure your awesome answers project is working.
You can always run `git clone https://github.com/CodeCoreYVR/awesome_answers_march_2020.git` to download the repository from github.

Rails Crud: Agenda
1) Introduction to CRUD
2) Wireframes
3) Review HTTP Verbs & Paths / URLS
4) Build CRUD

When we start our Rails server

We listen on `localhost:3000` which is our home url. "http://google.ca"

When users use our application all they're doing is sending requests to localhost:3000 with a specific HTTP VERB & PATH combination

HTTP VERBS WE USE

GET -> to request a resource (READ)
POST -> to mutate a resource (CREATE)
PATCH -> to edit an existing resource (UPDATE)
DELETE -> to delete an existing resource (DELETE)

PATHS FOR OUR APP

"/" -> root path/home
"/questions" -> questions resource

RESTful Web Service is a specific way to stucture your HTTP VERBS & PATHS

For example to get to the questions index page you would use: GET "/questions"
to get the show page you would use: GET "/questions/:id"
to createa question you would use: POST "/questions"
