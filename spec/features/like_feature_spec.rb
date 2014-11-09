require 'rails_helper'

describe 'liking posts' do
  before do
    sunrise = Post.create(caption: 'Sunrise')
  end

  it 'allows a user to like a post, which updates the post like count', js: true do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
