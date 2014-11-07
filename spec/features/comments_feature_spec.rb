require 'rails_helper'

describe 'comments' do
  before do
    Post.create(caption: 'Sunrise')
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
