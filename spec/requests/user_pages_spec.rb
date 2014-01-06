require 'spec_helper'
require 'factory_girl_rails'


describe "User Pages" do
  
  subject { page }

  describe "Signin page" do

    before { visit signin_path }

    it { should have_title('Sign In') }
    it { should have_content('Sign In') }
    it { should have_content('Email') }
    it { should have_content('Password') }

    let(:sign_in) { "Sign in" }  

    describe "with invalid information" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        fill_in "Email",        with: " "
        fill_in "Password",     with: " "
      end

      before { click_button sign_in }

      it { should have_title('Sign In') }
      it { should have_link('Sign In') }
      it { should_not have_link('Sign Out') }
      it { should have_content('Sign In') }
      it { should have_selector('div.alert.alert-notice', text: 'Invalid email/password combination!') }
    
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      
      before do
        fill_in "Email",        with: user.email
        fill_in "Password",     with: user.password
      end

      before { click_button sign_in }

      it { should have_title('User Profile') }
      it { should_not have_link('Sign In') }
      it { should have_link('Sign Out') }
              
      describe "followed by signout" do
        before { click_link "Sign Out" }
        it { should have_link('Sign In') }
        it { should_not have_link('Sign Out') }
        
      end

    end
     
  end


  describe "Sign up page" do
    before { visit signup_path }

    it { should have_title('Sign Up') }
    it { should have_content('Sign up') }
    it { should have_content('First name') }
    it { should have_content('Last name') }
    it { should have_content('Email') }
    it { should have_content('Phone') }
    it { should have_content('Company') }
    it { should have_content('Address') }
    it { should have_content('City') }
    it { should have_content('Zip') }
    it { should have_content('Password') }
    it { should have_content('Confirmation') }

    #it { should have_link('Create my account') }
    #it { should_not have_link('Sign in',  href: signin_path) }
         
    # expect to have some indication that this is for a 'demo' account
  
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button submit }

        it { should have_title('Sign Up') }
        it { should have_content('Sign Up') }
        it { should have_selector('div.alert.alert-error') }
      end

      it "does not email info@gulchsolutions.com" do   
        last_email.should be_nil
      end

    end

    describe "with valid information" do
      #let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "First name",   with: "J.S."
        fill_in "Last name",    with: "Roy"
        fill_in "Email",        with: "jroy@example.com"
        fill_in "Phone",        with: "555-555-5555"
        fill_in "Company",      with: "Acme Inc"
        fill_in "Address",      with: "123 Main St"
        fill_in "City",         with: "Any Town"
        fill_in "State",        with: "IL"
        fill_in "Zip",          with: "60607"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
      
        it { should have_title('User Profile') }
        it { should have_link('Sign Out') }
        it { should_not have_link('Sign In') }
        it { should have_selector('div.alert.alert-notice', text: 'Welcome to Gulch Solutions') }
      
        it "emails new user info to info@gulchsolutions.com" do

          last_email.to.should eq(["info@gulchsolutions.com"])
        
        end

        it "emails new user Welcome Email" do

          #last_email.to.should eq([user.email])

        end
      end
    end
  end


  describe "Profile page" do
    let(:user) { FactoryGirl.create(:user) }

# => user sign in
    before { visit signin_path }
    before do
      fill_in "Email",        with: user.email
      fill_in "Password",     with: user.password
    end
    let(:sign_in) { "Sign in" }  
    before { click_button sign_in }


    before { visit user_path(user) }

    # User Profile
    it { should have_title('Profile') }
    it { should have_content(user.first_name) }
    it { should have_content(user.last_name) }
    it { should have_content(user.email) }
    it { should have_content(user.phone) }
    it { should have_content(user.company) }
    it { should have_content(user.address) }
    it { should have_content(user.city) }
    it { should have_content(user.state) }
    it { should have_content(user.zip) }

    it { should have_link('Edit Profile') }

    describe "Edit user profile page" do
      before { click_link 'Edit Profile Info' }

      it { should have_selector('div.alert.alert-notice', text: "Contact 'support@gulchsolutions.com' if you wish to update your infomation.") }
      
      # User Profile
      it { should have_title('Profile') }
      it { should have_content(user.first_name) }
      it { should have_content(user.last_name) }
      it { should have_content(user.email) }
      it { should have_content(user.phone) }
      it { should have_content(user.company) }
      it { should have_content(user.address) }
      it { should have_content(user.city) }
      it { should have_content(user.state) }
      it { should have_content(user.zip) }

      it { should have_link('Edit Profile') }
          
    end
    
  end   

#  describe "edit" do
#    let(:user) { FactoryGirl.create(:user) }
#    before {visit edit_user_path(user) }
#
#    describe "page" do
#      it { should have_title('Edit') }
#      it { should have_content("Update your profile") }
#      it { should have_content("Save changes") }
#    end
#
#    describe "with invalid information" do
#      before { click_button "Save changes" }
#
#      it { should have_content('error') }
#    end
#
#    describe "with valid information" do
#      let(:new_first_name)  { "New" }
#      let(:new_email)       { "new@example.com" }
#      before do
#        fill_in "First name",       with: new_first_name
#        fill_in "Email",            with: new_email
#        fill_in "Password",         with: user.password
#        fill_in "Confirm Password", with: user.password
#        click_button "Save changes"
#      end
#
#      it { should have_title(new_name) }
#      it { should have_selector('div.alert.alert-success') }
#      it { should have_link('Sign out', href: signout_path) }
#      specify { expect(user.reload.first_name).to eq new_first_name }
#      specify { expect(user.reload.email).to      eq new_email }
#    end
#
#  end

end
