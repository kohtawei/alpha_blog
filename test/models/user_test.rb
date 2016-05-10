require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "tawei123", email: "tawei123@example.com", password: "password", admin: true)
  end

   test "user should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = " "
    assert_not @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "tawei123")
    assert_not @user2.valid?
  end

  test "username should not be too long" do
    @user.username = "a" *26
    assert_not @user.valid?
  end

  test "username should not be too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(email: "tawei123@example.com")
    assert_not @user2.valid?
  end
  
   test "email should not be too long" do
    @user.username = "a" * 41
    assert_not @user.valid?
  end
  
  test "email should be in valid format" do
    @user.email = "tawei123"
    assert_not @user.valid?
  end

end
