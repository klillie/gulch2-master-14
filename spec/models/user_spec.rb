require 'spec_helper'

describe User do

  	before { @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
  							phone: "555-867-5309", company: "Acme Inc", address: "123 Main St",
  							city: "Any Town", state: "IL", zip: "99999", password: "123456", 
  							password_confirmation: "123456") }

  	subject { @user }

  	it { should respond_to(:first_name) }
  	it { should respond_to(:last_name) }
  	it { should respond_to(:email) }
  	it { should respond_to(:phone) }
  	it { should respond_to(:company) }
  	it { should respond_to(:address) }
  	it { should respond_to(:city) }
  	it { should respond_to(:state) }
  	it { should respond_to(:zip) }
  	it { should respond_to(:password_digest) }
  	it { should respond_to(:password) }
  	it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
  	it { should respond_to(:authenticate) }
    it { should respond_to(:sites)}

    it { should be_valid }

# First name
  	describe "when first_name is not present" do
  		before { @user.first_name = " " }
  		it { should_not be_valid }
  	end

# Last name
    describe "when last_name is not present" do
      before { @user.last_name = " " }
      it { should_not be_valid }
    end

# Email
  	describe "when email format is invalid" do
    	it "should be invalid" do
      		addresses = %w[user@foo,com user_at_foo.org example.user@foo.
        	            foo@bar_baz.com foo@bar+baz.com]
     		addresses.each do |invalid_address|
        	@user.email = invalid_address
        	expect(@user).not_to be_valid
      	end
    	end
  	end

  	describe "when email format is valid" do
    	it "should be valid" do
      	addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      	addresses.each do |valid_address|
        	@user.email = valid_address
        	expect(@user).to be_valid
      	end
    	end
  	end

  	describe "when email address is already taken" do
    	before do
      	user_with_same_email = @user.dup
      	user_with_same_email.save
    	end

    	it { should_not be_valid }
  	end

# Phone number
  describe "when phone number is not present" do
    before do
      @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                phone: " ", company: "Acme Inc", address: "123 Main St",
                city: "Any Town", state: "IL", zip: "99999", password: "123456", 
                password_confirmation: "123456")
    end

    it { should_not be_valid }
  
  end

  describe "when phone number is not numbers" do
  

  end

  # contains more than 10 numbers
  # contains less than 10 numbers

# Company
  describe "when company is not present" do
    before do
      @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                phone: "555-867-5309", company: " ", address: "123 Main St",
                city: "Any Town", state: "IL", zip: "99999", password: "123456", 
                password_confirmation: "123456")
    end

    it { should_not be_valid }
  end

# State
  # contains other characters than just letters
  # is more than 2 characters long
  # is less than 2 characters long


# Zip
  # contains other characters than just numbers
  # is more than 5 characters long
  # is less than 5 characters long

# Password
	describe "when password is not present" do
  		before do
    		@user = User.new(first_name: "Example", last_name: "Example", email: "user@example.com",
                      phone: "555-867-5309", company: "Acme Inc", address: "123 Main St",
                      city: "Any Town", state: "IL", zip: "99999", 
                      password: " ", password_confirmation: " ")
  		end

  		it { should_not be_valid }

	end

  describe "with a password that's too short" do
   	before { @user.password = @user.password_confirmation = "a" * 5 }
   	it { should be_invalid }
  end

	describe "when password doesn't match confirmation" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
	end

	describe "return value of authenticate method" do
  	before { @user.save }
  	let(:found_user) { User.find_by(email: @user.email) }

  	describe "with valid password" do
   		it { should eq found_user.authenticate(@user.password) }
  	end

  	describe "with invalid password" do
   		let(:user_for_invalid_password) { found_user.authenticate("invalid") }

   		it { should_not eq user_for_invalid_password }
   		specify { expect(user_for_invalid_password).to be_false }
  	end
	end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "#send_password_reset" do
    let(:user) { FactoryGirl.create(:user) }

    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end

    it "saves the time tht password reset was sent" do
      user.send_password_reset
      user.reload.password_reset_sent_at.should be_present
    end

    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
end
