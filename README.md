Blocitoff is a Rails application that helps users manage their to-do lists. Blocitoff also uses Devise and Rake.

| User Stories
| -------------
| Users should be able to sign up for a free account by providing name, password and email
| User are able to sign in and out of application  
| User have access to their profile page
| Users are able to create multiple to-do items
| Users can mark to-do items as complete, at which point they will be deleted
| Users are able to see how old a to-do item is
| To-do items are automatically deleted seven days after creation date

| General Notes
| -------------
| [Devise](https://github.com/plataformatec/devise ) gem was used for user authentication.
| [Faker](https://github.com/stympy/fakerSeeded) database was used to populate database for testing.
| [Rake](http://railscasts.com/episodes/66-custom-rake-tasks) automation was used to delete tasks after seven days.
| [RSpec](http://rspec.info/) is the testing framework used.
