require 'rails_helper'

feature 'admin signs in' do
  scenario 'admin signs in as admin' do
    admin = User.create!(email: 'admin@admin.com',
                         avatar: nil, admin: true,
                         password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'


    expect(admin.admin?).to be true
  end
end
