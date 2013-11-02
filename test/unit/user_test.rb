require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "A User should enter a first name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end
   test "A User should enter a last name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end
   test "A User should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end
  test "A user should have a unique profile name" do
  	user= User.new
  	user.profile_name = users(:kiong).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end
  test "A user should have a profile name without spaces" do
	  user = User.new(first_name: 'kiong', last_name: 'Tan', email: 'kiong90@yahoo.com')
    user.password = user.password_confirmation = 'asdfasdf'
	  user.profile_name="My Profile With Spaces"
	  assert !user.save
	  assert !user.errors[:profile_name].empty?
	  assert user.errors[:profile_name].include? ("Must be formatted correctly.")
	end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'kiong', last_name: 'Tan', email: 'kiong90@yahoo.com')
    user.password = user.password_confirmation = 'asdfasdf'
    user.profile_name = 'kiongkiong_1'
    assert user.valid?
  end
end
