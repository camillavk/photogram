require 'rails_helper'

describe 'liking posts' do
  before do
    sunrise = Post.create(caption: 'Sunrise')
    sunrise.comments.create(comment: 'Awesome')
  end

  it 'allows a user to like a comment, which updates the comment like count', js: true do
    visit '/'
    click_link 'Sunrise'
    click_link 'Like'
    # visit '/'
    # click_link 'Sunrise'
    expect(page).to have_content('1 like')
  end
end
