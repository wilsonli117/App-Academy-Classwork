require 'rails_helper'

RSpec.describe User, type: :model do

  #validations
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:session_token)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  describe "uniqueness" do
    before :each do 
      create(:user)
    end
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
  end

  #associations
  it { should have_many(:goals) } #our goals
  it { should have_many(:cheers) } #our cheers given to others goals
  it { should have_many(:comments) } #comments user has posted
  it { should have_many(:profile_comments) } #comments on user profile
  it { should have_many(:goal_comments).through(:goals) } #others comments on your goals
  it { should have_many(:cheers_on_own_goals).through(:goals) } #cheers on our goals
  it { should have_many(:goals_cheered).through(:cheers) } #goals that we've cheered

  #public methods -- FIGVAPER
  #find_by_credentials
  #is_password?
  #generate_session_token
  #attr_reader
  #password=
  #ensure_session_token
  #reset_session_token!
  
  describe "::find_by_credentials" do 
    let!(:user) {create(:user)} #our Superhero! <<<must be within describe
    #valid credentials context
    #invalid credentials context
    #expect to receive .is_password? 
    #should return that user 
    
      context "with valid credentials" do
          it "should return user" do
            expect(User.find_by_credentials(user.username, user.password)).to eq(user)
          end
      end

      context "with invalid credentials" do
          it "should return nil" do
            expect(User.find_by_credentials(user.username, "wrong_password")).to be(nil)
          end
      end
  end

  describe "#is_password?" do
      let!(:user) {create(:user)}
      context "if password is valid" do
          it "should return true" do
            expect(user.is_password?("password")).to be(true)
          end
      end

      context "if password is invalid" do
          it "should return false" do
            expect(user.is_password?("pw")).to be(false)
          end
      end
  end

  describe "#password=" do
    #expect password digest to not be password << self.password_digest = password
    #expect password digest to not be nil
    #expect to return password digest 
    let!(:user) {create(:user)}
    it "should set password to password_digest" do
      expect(user.password_digest).not_to be(nil)
      expect(user.password_digest).not_to be("password")
    end
  end 

  # describe "#reset_session_token" do
  #   #assigns NEW session_token
  #   #saves to database => make sure user receives .save!
  #   #returns the session_token
  # end

end
