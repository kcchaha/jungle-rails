require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do

  
  
  scenario "redirect to home page after user successfully logged in" do
    @user = User.create!(
      first_name: 'Chenchen',
      last_name: 'Enfys',
      email: 'kcchaha@gmail.com',
      password: 'enfys123',
      password_confirmation: 'enfys123'
    )
    visit root_path
    click_on 'Log In'
    sleep(2)

    
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    click_on 'Submit'
    
    # save_screenshot
    expect(page).to have_content "Log Out"
  end
end
