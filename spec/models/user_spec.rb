require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
  end

  describe 'Class Methods' do
    it '::from_omniauth' do
      user = OmniAuth::AuthHash.new({
              :provider => 'google_oauth2',
              :uid => '123545',
              :info => {
                    :first_name => 'Test',
                    :last_name => "Test",
                    :email => "test@test.com"
                  },
                  :credentials => {
                    :token => "token",
                    :secret => "secret"
                  }
                  })
      expect(User.from_omniauth(user)).to eq(User.first)
    end
    describe "::find_circle" do
      it "retreives user objects in an array from given data set" do
        user1 = User.create!(id: 10000002, first_name: "Bob", last_name: "Jones", email: "somethingelse2@example.com",username: "test-user-24", google_id: "245234", zip: "80022", bio:"i love music and arts", picture_url: "http://www.ikozmik.com/Content/Images/uploaded/its-free-featured.jpg")
        user2 = User.create!(id: 10000003, first_name: "Alexander", last_name: "Jones", email: "somethingelse3@example.com",username: "test-user-45", google_id: "245235", zip: "80023", bio:"Trying to connect with more artists")
        user3 = User.create!(id: 10000004,first_name: "Sid", last_name: "Jones", email: "else@example.com",username: "test-user-457788", google_id: "44355676", zip: "80024", bio:"Photography is my passion")
        user4 = User.create!(id: 10000005,first_name: "Simon", last_name: "Smith", email: "smith_else@example.com",username: "test-user-788", google_id: "12355676", zip: "80025", bio:"I love turtles")
        data =  [{:id=>"17",
           :type=>"profile",
           :attributes=>{:zipcode=>"80022", :user_id=>10000002, :profile_picture=>"http://www.google.com", :username=>nil}},
          {:id=>"18",
           :type=>"profile",
           :attributes=>{:zipcode=>"80023", :user_id=>10000003, :profile_picture=>"http://www.google.com", :username=>nil}},
          {:id=>"19",
           :type=>"profile",
          :attributes=>{:zipcode=>"80024", :user_id=>10000004, :profile_picture=>"http://www.google.com", :username=>nil}},
          {:id=>"20",
           :type=>"profile",
           :attributes=>{:zipcode=>"80025", :user_id=>10000005, :profile_picture=>"http://www.google.com", :username=>nil}}]

           expect(User.find_circle(data).length).to eq(4)
           expect(User.find_circle(data).class).to eq(Array)
           expect(User.find_circle(data).first.class).to eq(User)
           expect(User.find_circle(data).first).to eq(user1)
           expect(User.find_circle(data).second).to eq(user2)
           expect(User.find_circle(data).third).to eq(user3)
           expect(User.find_circle(data).fourth).to eq(user4)
      end
    end
  end
end