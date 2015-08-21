require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

RSpec.configure do |config|
  config.include Capybara::DSL
end

# I had to put this in due to an error on line 54. It's possible other students encountered this problem as well.
#
# 1) adding clients to a stylist allows a user to add a client to a stylist
#    Failure/Error: visit("/stylists/#{lydia.id()}")
#    NoMethodError:
#      undefined method `visit' for #<RSpec::ExampleGroups::AddingClientsToAStylist:0x007fc9756e0a00>
#    # ./spec/hair_salon_integration_spec.rb:42:in `block (2 levels) in <top (required)>'

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a stylist and view thier clients and stylist details') do
    visit('/')
    click_link('Add a Stylist')
    fill_in('name', :with => 'Lydia')
    click_button('Add Stylist')
    expect(page).to have_content('Operation Success!')
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

describe('viewing an individual stylist', {:type => :feature}) do
  it('allows a user to view an individual stylist page and see their details and clients') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia.id()})
    maurice.save()
    visit('/stylists')
    click_link(lydia.name())
    expect(page).to have_content(maurice.name())
  end
end

describe('adding clients to a stylist', {:type => :feature}) do
  it('allows a user to add a client to a stylist') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    visit("/stylists/#{lydia.id()}")
    fill_in("name", {:with => 'Maurice'})
    click_button('Add Client')
    expect(page).to have_content('Operation Success!')
  end
end

describe('updating stylist information', {:type => :feature}) do
  it('allows a user to update the name of a stylist') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    visit("/stylists/#{lydia.id()}")
    fill_in("update_name", {:with => 'Christine'})
    click_button('Update Stylist')
    expect(page).to have_content('Operation Success!')
  end
end

describe('updating client information', {:type => :feature}) do
  it('allows a user to update the name of a client') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia.id()})
    maurice.save()
    visit("/clients/#{maurice.id()}")
    fill_in("update_name", {:with => 'Kevin'})
    click_button('Update Client')
    expect(page).to have_content('Operation Success!')
  end
end

describe('deleting stylist information', {:type => :feature}) do
  it('allows a user to delete a stylist') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    visit("/stylists/#{lydia.id()}")
    click_button('Delete Stylist')
    expect(page).to have_content('Operation Success!')
  end
end

describe('deleting client information', {:type => :feature}) do
  it('allows a user to delete a client') do
    lydia = Stylist.new({:name => 'Lydia', :id => nil})
    lydia.save()
    maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia.id()})
    maurice.save()
    visit("/clients/#{maurice.id()}")
    click_button('Delete Client')
    expect(page).to have_content('Operation Success!')
  end
end
