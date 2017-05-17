require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.first
  end

  it 'has many places' do
    @user.places.create
    expect(@user.places.count).to eq(1)
  end

  it 'has many items through places' do
    @user.places.create
    @user.places.first.items.create
    expect(@user.items.count).to eq(1)
  end

end