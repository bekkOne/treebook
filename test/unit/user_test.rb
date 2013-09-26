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
	test "user should have a unique profile name" do
		user = User.new
		user.profile_name = users(:tomas).profile_name
		assert !user.save
		assert !user.errors[:profile_name].empty?
	end
	test "a user should have a profile name without spaces" do
		user = User.new(first_name: 'Tomaas', last_name: 'Bezdekk', email: 'bekk1@seznam.cz')
		user.password = user.password_confirmation = 'jhjgghhkh'
		user.profile_name = "profile name with spaces"
		assert !user.save
		assert !user.errors[:profile_name].empty?
		assert user.errors[:profile_name].include?("Must be formatted correctly.")
	end
	test "that check when it is profile name formated correctly" do
		user = User.new(first_name: 'Tomaas', last_name: 'Bezdekk', email: 'bekk1@seznam.cz')
		user.password = user.password_confirmation = 'jhjgghhkh'
		user.profile_name = 'bekkone1'
		assert user.valid?
		# assert !user.save
		# assert !user.errors[:profile_name].empty?
	end
end
