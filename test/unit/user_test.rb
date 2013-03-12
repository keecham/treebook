require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:Dummy).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?

  end

  test "a user should have a profile name without spaces" do
  	user = User.new(first_name: 'Kishore', last_name: 'Eechambadi', email: 'keecham2@gmail.com')
    user.password = user.password_confirmation = 'adsada'

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Kishore', last_name: 'Eechambadi', email: 'keecham2@gmail.com')
    user.password = user.password_confirmation = 'adsada'
    user.profile_name = 'kishoreE1'
    assert user.valid?
  end

end