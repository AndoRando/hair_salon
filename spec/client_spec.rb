require('spec_helper')

describe(Client) do
  describe('#name') do
    it('returns the name of a client') do
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      expect(maurice.name()).to(eq('Maurice'))
    end
  end

  describe('#==') do
    it('is the same client if it has the same name') do
      maurice1 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice2 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      expect(maurice1).to(eq(maurice2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a client to the database') do
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice.save()
      expect(Client.all()).to(eq([maurice]))
    end
  end

  describe('#id') do
    it('sets client ID when saved') do
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice.save()
      expect(maurice.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a client by their ID') do
      maurice1 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice1.save()
      maurice2 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice2.save()
      expect(Client.find(maurice1.id())).to(eq(maurice2))
    end
  end

  describe('#stylist_id') do
    it('returns the stylist of a specific client') do
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      expect(maurice.stylist_id()).to(eq(1))
    end
  end

  describe('#update') do
    it('updates clients in the database') do
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => 1})
      maurice.save()
      maurice.update({:name => 'Steffan'})
      expect(maurice.name()).to(eq('Steffan'))
    end
  end

  describe('#delete') do
    it('deletes a client from the database') do
      lydia1 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia1.save()
      maurice1 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia1.id()})
      maurice1.save()
      maurice2 = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia1.id()})
      maurice2.save()
      maurice1.delete()
      expect(Client.all()).to(eq([maurice2]))
    end
  end
end
