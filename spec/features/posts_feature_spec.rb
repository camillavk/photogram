require 'rails_helper'
require_relative 'helpers/application'

include ApplicationHelper

describe 'posts' do
  context 'creating posts' do
    it 'requires users to be signed in first' do
      visit '/'
      expect(page).not_to have_content 'New Post'
    end
  end

  context 'creating posts when signed in' do
    before do
      visit '/'
      sign_up
    end

    it 'prompts users to fill in a form then displays the new post' do
      visit '/'
      click_link 'New Post'
      fill_in 'Caption', with: 'Sunrise'
      click_button 'Create Post'
      expect(page).to have_content 'Sunrise'
    end

    xit 'can upload a picture' do
      visit '/'
      click_link 'New Post'
      attach_file 'Image', File.join(Rails.root, 'spec', 'fixtures', 'Eeyore.jpg')
      fill_in 'Caption', with: 'Sunrise'
      click_button 'Create Post'
      expect(page).to have_content 'Post successfully saved'
    end
  end

  context 'viewing posts' do
    before do
      @sunrise = Post.create(caption: 'Sunrise')
    end

    it 'lets a user view a post' do
      visit '/'
      click_link 'Sunrise'
      expect(current_path).to eq "/posts/#{@sunrise.id}"
    end
  end

  context 'changing posts' do
    before do
      visit '/'
      sign_up
      User.first().posts.create(caption: 'Sunrise')
    end


    it 'lets a user edit their own post' do
      visit '/'
      click_link 'Edit Sunrise'
      fill_in 'Caption', with: 'Sunset'
      click_button 'Update Post'
      expect(page).to have_content 'Sunset'
    end

    it 'removes a post when user deletes it' do
      visit '/'
      click_link 'Delete Sunrise'
      expect(page).not_to have_content 'Sunrise'
    end
  end
end
