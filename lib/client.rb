class Client
  attr_reader(:name, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @id = attr.fetch(:id)
  end

  define_method(:==) do |other_client|
    self.name().==(other_client.name())
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i()
      clients.push(Client.new({:name => name, :id => id}))
    end
    clients
  end

  define_method(:save) do
    save_me = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = save_me.first().fetch("id").to_i()
  end
end
