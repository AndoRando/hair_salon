require('pry')

class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @id = attr.fetch(:id)
  end

  define_method(:==) do |other_stylist|
    self.name().==(other_stylist.name())
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all.each() do |stylist|
      if stylist.id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:save) do
    save_me = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = save_me.first().fetch("id").to_i()
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      stylist_clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    stylist_clients
  end
end
