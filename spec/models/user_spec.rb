require 'rails_helper'

RSpec.describe User, type: :model do
  it "has no user to begin with" do
    expect(User.count).to eq 0
  end

  it "has one user after creating one" do
    User.create
    expect(User.count).to eq 1
  end
end
