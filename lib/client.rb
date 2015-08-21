class Client
  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @id = attr.fetch(:id)
    @stylist_id = attr.fetch(:stylist_id)
  end

  define_method(:==) do |other_client|
    self.name().==(other_client.name())
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i()
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all.each() do |client|
      if client.id().==(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:save) do
    save_me = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = save_me.first().fetch("id").to_i()
  end

  define_method(:update) do |attr|
    @name = attr.fetch(:name)
    @id = self.id()
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id}")
  end
end
