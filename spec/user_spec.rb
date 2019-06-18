RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is not valid without a first_name" do
      user = User.new(
        first_name: nil,
        last_name: 'enfys',
        email: 'test@test.com',
        password: 'qweqwe',
        password_confirmation: 'qweqwe'
      )
      expect(user).to be_invalid
    end

    it "is not valid without a last_name" do
      user = User.new(
        first_name: 'enfys',
        last_name: nil,
        email: 'test@test.com',
        password: 'qweqwe',
        password_confirmation: 'qweqwe'
      )
      expect(user).to be_invalid
    end

    it "is not valid without an email" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: nil,
        password: 'qweqwe',
        password_confirmation: 'qweqwe'
      )
      expect(user).to be_invalid
    end

    it "is not valid without a password" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: nil,
        password_confirmation: 'qweqwe'
        )
      expect(user).to be_invalid
    end

    it "is not valid without a password_confirmation" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: 'qweqwe',
        password_confirmation: nil
      )
      expect(user).to be_invalid
    end

    it "is not valid if password as not the same as password_confirmation" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: 'qweqwe',
        password_confirmation: 'Qweqwe'
      )
      expect(user).to be_invalid
    end

    it "is not valid if register an email that has already existed in the database" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: 'qweqwe',
        password_confirmation: 'Qweqwe'
      )
      user.save

      user1 = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'TEST@TEST.com',
        password: 'qweqwe',
        password_confirmation: 'Qweqwe'
      )
      expect(user).to be_invalid
    end

    it "should have a minimum length of 8 on the password when creating an account" do
      user = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: '1234vfdvdvvv',
        password_confirmation: '1234vfdvdvvv'
      )

      user1 = User.new(
        first_name: 'chenchen',
        last_name: 'enfys',
        email: 'test@test.com',
        password: '123d',
        password_confirmation: '123d'
      )
      expect(user).to be_valid
      expect(user1).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    
    it "is not valid if the user is not authenticated" do
        user = User.new(
            first_name: 'chenchen',
            last_name: 'enfys',
            email: 'test1@test.com',
            password: '123nhhhhhhhhd',
            password_confirmation: '123nhhhhhhhhd'
        )
        user.save!
      user1 = User.new(
          first_name: 'chenchen',
      last_name: 'enfys',
      email: 'test2@test.com',
      password: '123nhhhhhhhhd',
      password_confirmation: '123nhhhhhhhhd')
      expect(user1).to be_valid
    end
  end
end