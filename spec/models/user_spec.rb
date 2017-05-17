require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(
        name: 'John Smith',
        email: 'john@smith.com',
        password: Faker::Internet.password
    )
  end

  it 'has an name' do
    expect(@user.name).to eq('John Smith')
  end

  it 'has an email' do
    expect(@user.email).to eq('john@smith.com')
  end

  it 'has many places' do
    @user.places.create
    expect(@user.places.count).to eq(1)
  end

  it 'has many items through places' do
    @user.places.create
    @user.places.last.items.create
    expect(@user.items.count).to eq(1)
  end

end