# frozen_string_literal: true
require 'rails_helper'

feature 'profile photo' do
  scenario 'user uploads a profile photo' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'ash@s-mart.com'
    fill_in 'Password', with: 'boomstick!3vilisd3ad'
    fill_in 'Password confirmation', with: 'boomstick!3vilisd3ad'
    attach_file 'Profile Picture',
                "#{Rails.root}/spec/support/images/IMG_3327.jpg"
    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end

feature 'edit profile photo' do
  scenario 'user changes profile_photo' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: 'ash@s-mart.com'
    fill_in 'Password', with: 'boomstick!3vilisd3ad'
    fill_in 'Password confirmation', with: 'boomstick!3vilisd3ad'
    attach_file 'Profile Picture',
                "#{Rails.root}/spec/support/images/IMG_3327.jpg"
    click_button 'Sign up'

    expect(page).to have_text('Welcome! You have signed up successfully.')

    click_on 'Edit Profile'
    attach_file 'Profile Picture',
                "#{Rails.root}/spec/support/images/IMG_3327.jpg"
    fill_in 'Current password', with: 'boomstick!3vilisd3ad'
    click_on 'Update'

    expect(page).to have_content('Your account has been updated successfully.')
  end
end
