Specifications for the Rails Assessment
Specs:

 [x] Using Ruby on Rails for the project
    - had the gem downloaded after putting it in the Gemfile and created a new rails  app using the rails new command
 [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    - pet has many appointments
 [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    - appointment belongs to pet
 [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    - pets have many appointments and has many groomers through appointments, and the groomers have many appointments and has many pets through the appointments
 [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    - pets have many appointments and has many groomers through appointments, and the groomers have many appointments and has many pets through the appointments. 
 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    - appointment has attributes of date, time, haircut_type, etc.
 [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    - I gave the Groomer model validations for its username to be present and to be minimum of 6 characters and maximum of 12. And for it to be unique.
 [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    - I included a scope method that shows only the current day's appointments with the class method self.from_today.
 [x] Include signup (how e.g. Devise)
    - groomer has a signup form and is able to signup
 [x] Include login (how e.g. Devise)
    - groomer has a login form and is able to signup
 [x] Include logout (how e.g. Devise)
    - groomer can logout once they click on the logout link, session is cleared
 [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - set up Omniauth through Github
 [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - pet routes were nested in owners, appointments were nested in groomers
 [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    - owners/1/pets/new
 [x] Include form display of validation errors (form URL e.g. /recipes/new)
    - errors are displayed when user tries to sign up with less than the minimum characters required to create a username

Confirm:

 [x] The application is pretty DRY
 [x] Limited logic in controllers
 [x] Views use helper methods if appropriate
 [x] Views use partials if appropriate