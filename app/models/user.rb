class User < ApplicationRecord
  has_secure_password
  # Rails has authentication already built in. Calling this method within a model will initialize the authentication logic for the model
  # It does the following:
  # Provides authentication
  # Adds two attr_accessors :password & :password_confirmation
  # Adds a presence validation for :password
  # It will hash passwords automatically for us and store them in a column called password_digest
  # It will add an instance method called authenticate() that accepts a string(password) as an argument. It will run the string(password) against the same hashing algorithm, if the hash matches the one stored in the database then the password is correct and it will return the user, if the hash does not match it will return false.
  # This method requires:
  # 1) the bcrypt library/gem
  # 2) a column in the table(model) called password_digest
  has_many :questions
  # u = User.find(15)
  # u.questions -> because of the has_many relationship will return all the questions that belong to user
  has_many :answers
end
