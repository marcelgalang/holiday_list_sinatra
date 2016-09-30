
# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app

-Sinatra GEM is included in Gemfile. ApplicationController inherits from Sinatra::Base. Routes written for Sinatra

- [x] Use ActiveRecord for storing information in a database

-ActiveRecord migrations are used for database creation

- [x] Include more than one model class (list of model class names e.g. User, Post, Category)

-Recipient and User models are implemented

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)

-User has many recipients.  Represented in User model.
  
- [x] Include user accounts

-UserController has standard routes for login, logout and sign up.

- [x] Ensure that users can't modify content created by other users

-A users id must match for editing of a recipient page.

- [x] Include user input validations

-validates for presence of content as well as uniqueness of username in models

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

- [ ] You have a large number of small Git commits

-I wish I would have made more and more often.  My personal goal is to commit every few lines or every ten minutes on future projects. Please see blog page for extended remarks.

- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
