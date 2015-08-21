require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a stylist and view thier clients and stylist details') do
    visit('/')
    click_link('Add a Stylist')
    fill_in('name', :with => 'Lydia')
    click_button('Add Stylist')
    expect(page).to have_content('Successfully added!')
  end
end

describe('viewing all stylists', {:type => :feature}) do
  it('allows a user to view all stylists in the system with links to their individual pages') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    visit('/')
    click_link('See all Stylists')
    expect(page).to have_content(lydia.name())
  end
end