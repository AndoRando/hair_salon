require('sinatra')
require('sinatra/reloader')
require('./lib/stylist')
require('./lib/client')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})


get('/') do
  erb(:index)
end

get('/stylists/new') do
  erb(:stylist_new)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post('/clients') do
  name = params.fetch('name')
  stylist_id = params.fetch('stylist_id').to_i()
  @stylist = Stylist.find(stylist_id)
  @client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id})
  @client.save()
  erb(:success)
end

get('clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  erb(:client)
end
