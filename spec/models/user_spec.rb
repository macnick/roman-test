require 'rails_helper'

RSpec.describe User, type: :model do
  it "has no user to begin with" do
    expect(User.count).to eq 0
  end

  it "can not create a user without filling the fields" do
    User.create
    expect(User.count).to eq 0
  end

  it "has one user after creating one" do
    User.create(first_name: "Nick", last_name: "Haras", email: "dev@nickharas.com", password: "123456")
    expect(User.count).to eq 1
  end
end
