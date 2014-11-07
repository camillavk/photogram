require 'rails_helper'

describe 'homepage' do
  context 'no users have signed in' do
    it 'should display a sign up link' do
      visit '/'
      expect(page).to have_link 'Sign up'
    end
  end
end
