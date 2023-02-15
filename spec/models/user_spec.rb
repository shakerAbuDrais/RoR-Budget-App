require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:categories) }
  it { should have_many(:payments) }
  it 'creates a new user with the given full name and email' do
    user = User.new(full_name: 'John Doe', email: 'johndoe@example.com')
    expect(user.full_name).to eq 'John Doe'
    expect(user.email).to eq 'johndoe@example.com'
  end
  it 'creates a new user with the given password' do
    user = User.new(password: 'password')
    expect(user.password).to eq 'password'
  end
  it 'creates a new user with the given id' do
    user = User.new(id: 1)
    expect(user.id).to eq 1
  end

  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
