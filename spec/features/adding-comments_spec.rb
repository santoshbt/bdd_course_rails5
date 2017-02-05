require 'rails_helper'

RSpec.feature "Creating Articles"  do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    @fred = User.create(email: 'fred@example.com', password: 'password')
    @article = Article.create!(title: "Article one", body: "Body of article one", user: @john)
  end
  
  scenario "permits a signed in user to be owner" do
    login_as(@fred)
    
    visit '/'
    click_link @article.title
  end
end