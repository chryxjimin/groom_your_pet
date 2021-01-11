DB
models for 
- groomers
- appointment (vaccination_records, haircut_length, additional_services)
- pets (name, age, weight, owner_name, email, phone_number)

Controllers
- sessions
- pets
- users
- appointments 

what urls do I need?
- get '/signup' - form
- post '/signup' - creates the user in the DB
- get '/login' - form
- post '/login' - logs in the user into their account, creates a new session
- get '/logout' - deletes the session
- get 'appointments/new' - form 
- get 'appointment/:id' 
              
many_to_many? pets have many appointments through pet groomers 
              groomers can have many pets through owners

Nested routes - new, index or show
Validations
Authentification
Bcrypt