require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of a client') do
      customer = Client.new({:name => 'Maurice', :id => nil})
      expect(customer.name()).to(eq('Maurice'))
    end
  end

  describe('#==') do
    it('is the same client if it has the same name') do
      customer1 = Client.new({:name => 'Maurice', :id => nil})
      customer2 = Client.new({:name => 'Maurice', :id => nil})
      expect(customer1).to(eq(customer2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a client to the database') do
      customer = Client.new({:name => 'Maurice', :id => nil})
      customer.save()
      expect(Client.all()).to(eq([customer]))
    end
  end

  describe('#id') do
    it('sets client ID when saved') do
      customer = Client.new({:name => 'Maurice', :id => nil})
      customer.save()
      expect(customer.id()).to(be_an_instance_of(Fixnum))
    end
  end
end
