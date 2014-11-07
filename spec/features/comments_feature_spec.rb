require 'rails_helper'

describe 'comments' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'testtest'
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    User.first().posts.create(caption: 'Sunrise')
  end

  it 'allows users to leave a comment using a form' do
    visit '/'
    click_link 'Comment on Sunrise'
    fill_in 'Comment', with: 'Beautiful'
    click_button 'Leave Comment'
    expect(current_path).to eq '/'
  end

  it 'shows the comment on the posts page' do
    visit '/'
    click_link 'Comment on Sunrise'
    fill_in 'Comment', with: 'Beautiful'
    click_button 'Leave Comment'
    click_link 'Sunrise'
    expect(page).to have_content 'Beautiful'
  end
end
