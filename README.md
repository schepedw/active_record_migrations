# Active Record Migrations

This exercise is intended to familiarize you with Active Record
migrations. Sure, you know what they are, but how good are you with
them?

It is your job to incrementally change the database for this
application, writing migrations to satisfy the requirements described below. The challenge? __Do it
without losing any of the rows created by the initial db seeding__

## Setup
You'll need to run `rake db:create_roles` and `rake db:setup`. Note that
db:setup is the same as `db:create db:schema:load db:seed`. 

## Testing
The tests in #TODO are organized in sections, each of which corresponds
a requirements section below. #TODO - will this be incremental, or
should the tests for each requirements section be the only ones that
pass?

 #remember `be rspec` to run tests
## Requirements

0. Familiarize yourself with the DB in its initial state
1. A user's SSN shouldn't be nullable! Fix that.
2. If an account balance isn't given on creation, default to $0.
2. Add login to a user.
⋅⋅1. A login can't be nil. For existing users, use first of first name +
complete last name
⋅⋅⋅⋅1. Don't worry about fixing conflicts at the model level. We're not
worried about validations right now
⋅⋅⋅⋅2. Bonus points if you can write a migration that will fix a
conflict by appending the subsequent number to a login -> mjohnson,
mjohnson1, mjohnson2, etc.
3. Make `Account#account_type_id` a foreign key to `AccountType`
4. We've decided normalization is overrated
⋅⋅⋅⋅1. We want to store `account_type` name in `Account`
⋅⋅⋅⋅2. `Account#account_type` should be the name corresponding to
`Account#account_type_id`.
⋅⋅⋅⋅3. We don't need `Account#account_type_id` anymore
⋅⋅⋅⋅4. We don't need `AccountType` anymore either


##Resources
[Active Record
Migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)
