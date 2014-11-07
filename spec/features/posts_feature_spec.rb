require 'rails_helper'

describe 'homepage' do
  context 'no users have signed in' do
    it 'should display a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign up'
    end
  end
end

describe 'posts' do
  context 'creating posts' do
    it 'prompts users to fill in a form then displays the new post' do
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: 'Sunrise'
      click_button 'Create Post'
      expect(page).to have_content 'Sunrise'
    end

    it 'can upload a picture' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', File.join(Rails.root, 'spec', 'fixtures', 'Eeyore.jpg')
      fill_in 'Caption', with: 'Sunrise'
      click_button 'Create Post'
      expect(page).to have_content 'Post successfully saved'
    end
  end
end


# attach_file 'Photo', File.join(Rails.root, 'public', 'images', 'default.png')
