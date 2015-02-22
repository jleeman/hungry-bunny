require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it "password must be greater than five characters" do
    u = User.create(email: "joshleeman@gmail.com", password: "abc")
    expect(User.count).to eq(0)
  end

  it "email must be unique" do
    u = User.create(email: "joshleeman@gmail.com", password: "abcdef")
    u2 = User.create(email: "joshleeman@gmail.com", password: "abcdef")
    expect(User.count).to eq(1)
  end  
end
