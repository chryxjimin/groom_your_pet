DB
need to apply strong_params
models for 
- groomers(has_secure_password)
- appointment (vaccination_records, haircut_length, additional_services)
- pets (name, age, weight)
- owner (name, email, phone_number)

Controllers
- sessions
- pets
- owners
- groomers
- appointments 

SessionsController
- new
- create
- destroy

PetsController
- new
- create
- edit
- update
- show
- index
- destroy

OwnersController
- new
- create
- index
- show
- edit
- update 
- destroy

GroomersController
- new
- create
- show
- index
- update
- destroy

AppointmentsController
- new
- create
- show
- index
- update
- destroy

allow only groomers who are authorized to schedule, edit, and cancel the appointments, view the info about the pet and the owner

what urls do I need?
- get '/signup' - form
- post '/signup' - creates the user in the DB
- get '/login' - form
- post '/login' - logs in the user into their account, creates a new session
- get '/logout' - deletes the session
- get 'appointments/new' - form 
- get 'appointment/:id' - form
- root to:'appointments#index - form 
              
many_to_many? pets have many appointments through pet groomers 
              groomers can have many pets through owners

Validations





Things to work on:


DUE BY FRIDAY

added the scope method to show the current day's appointments for the current_groomer on the sessions#success view route once the user logs in 
refactor appointments to not nest when using current_groomer
DRY code with before_action