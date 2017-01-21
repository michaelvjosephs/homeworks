require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user, username: "michael", password: "password")
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  it { should have_many(:subs) }
  # commented out because we didn't get here in the assignment
  # it { should have_many(:user_votes) }
  # it { should have_many(:comments) }

  describe "#is_password?" do
    it "checks that corresponding password_digest matches password" do
      expect(user.is_password?("password")).to be true
    end

    it "checks that non-corresponding password_digest does not match password" do
      expect(user.is_password?("blahblahblah")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "changes user's session token" do
      user.valid?
      previous_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(previous_session_token)
    end

    it "returns the user's new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "::find_by_credentials" do
    it "returns a user if one is found" do
      expect(User.find_by_credentials("michael", "password")).to eq(user)
    end

    it "returns nil if no user is found" do
      expect(User.find_by_credentials("blah", "blahblahblah")).to eq(nil)
    end
  end
end
