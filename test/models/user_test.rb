require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'valid user' do
    user = User.new(email: 'ilia@ilia.com', password: 'ilia242')
    assert user.valid?
  end

  test 'invalid without email' do
    user = User.new(password: 'ilia244')
    refute user.valid?, 'user is valid without an email'
    assert_not_nil user.errors[:email], 'no validation error for email present'
  end

  test 'email validity' do
    user = User.new(email: 'ilia', password: 'ilia242')
    refute user.valid?, 'user is valid without a valid email'
    assert_not_nil user.errors[:email], 'no validation error for email integrity present'
  end

  test 'password length' do
    user = User.new(email: 'ilia@ilia.com', password: 'ilia')
    refute user.valid?, 'user is valid with invalid password'
    assert_not_nil user.errors[:password], 'no validation error for password length present'
  end

  test 'invalid without password' do
    user = User.new(email: 'ilia@ilia.com')
    refute user.valid?, 'user is valid without a password'
    assert_not_nil user.errors[:password], 'no validation error for password present'
  end

  test "New user(before saving) has nil avatar" do
    user = User.new(email: 'ilia@ilia', password: 'ili2444')
    assert user[:avatar] == nil, 'user has no avatar field'
  end

end
