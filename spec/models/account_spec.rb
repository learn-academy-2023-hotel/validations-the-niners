require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is not valid without a name' do
    oscar = Account.create(
      password: 'password',
      email: 'oscar@gmail.com'
    )
    expect(oscar.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    oscar = Account.create(
      username: 'oscar',
      email: 'oscar@gmail.com'
    )
    expect(oscar.errors[:password]).to_not be_empty
  end

  it 'is not valid without an email' do
    oscar = Account.create(
      username: 'oscar',
      password: 'password'
    )
    expect(oscar.errors[:email]).to_not be_empty
  end

  it 'is not valid if username is less than 5 characters' do
    oscar = Account.create(username:"osca", password:'password', email:'oscar@gmail.com'
    )
    expect(oscar.errors[:username]).to_not be_empty
  end

  it 'does not allow duplicate usernames' do
    Account.create(
      username: 'Oscar',
      password: 'password',
      email: 'o@gmail.com'
    )
    oscar = Account.create(
      username: 'Oscar',
      password: 'password',
      email: 'o@gmail.com'
    )
    expect(oscar.errors[:username]).to_not be_empty
  end
end