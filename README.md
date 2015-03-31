# Active Record Migrations

This exercise is intended to familiarize you with Active Record
migrations. Sure, you know what they are, but how good are you with
them?

It is your job to incrementally change the database for this
application, writing migrations to satisfy the requirements described below. The challenge? __Do it
without losing any of the rows created by the initial db seeding__. Rake
has been changed to not reset your db between tests. See
`lib/tasks/db_tasks.rake` if you're curious how that is done.

You also shoudn't roll back any of the existing migrations to edit them
and satisfy the requirements. Instead, write new ones.

## Setup
You'll need to run `rake db:create_roles` and `RAILS_ENV=test rake db:setup`. Note that
db:setup is the same as `db:create db:schema:load db:seed`.

If you've got everything set up correctly, you should be able to run
`be rspec` and see one passing test

## Testing
The tests in the spec folder are organized in sections, each of which
corresponds to a requirements section below. You should:
1. Uncomment the test for requirement x
2. Run the test for requirement x, watch it fail
3. Write the migration for requirement x
4. Run the tests, watch them pass
5. Repeat with requirement x + 1

run the tests with `be rspec` from the root folder

## Requirements

1. Familiarize yourself with the DB in its initial state
2. A user's SSN shouldn't be nullable! Fix that.
3. If an account balance isn't given on creation, default to $0.
4. Add login to a user.
  1. A login can't be nil. For existing users, use first of first name +
complete last name
    1. Don't worry about fixing conflicts at the model level. We're not
worried about validations right now
    2. Bonus points if you can write a migration that will fix a
conflict by appending the subsequent number to a login -> mjohnson,
mjohnson1, mjohnson2, etc.
5. Wait, shouldn't a user's ssn be unique? Fix that.
6. Make `Account#account_type_id` a foreign key to `AccountType`
7. We've decided normalization is overrated
    1. We want to store `account_type` in `Account`
      1. Will be the name of the account type that account points to
      1. Account#account_type can't be null
    2. We don't need `Account#account_type_id` anymore
    3. We don't need `AccountType` anymore either


##Resources
[Active Record
Migrations](http://edgeguides.rubyonrails.org/active_record_migrations.html)

If you get really stuck, you can take a look at [my
solution](https://github.com/schepedw/active_record_migrations/tree/dans_solution)
