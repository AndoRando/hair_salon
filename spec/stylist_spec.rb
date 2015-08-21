require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('returns the name of a stylist') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      expect(lydia.name()).to(eq('Lydia'))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same name') do
      lydia1 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia2 = Stylist.new({:name => 'Lydia', :id => nil})
      expect(lydia1).to(eq(lydia2))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a stylist to the database') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      lydia.save()
      expect(Stylist.all()).to(eq([lydia]))
    end
  end

  describe('#id') do
    it('sets stylist ID when saved') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      lydia.save()
      expect(lydia.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a stylist by their ID') do
      lydia1 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia1.save()
      lydia2 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia2.save()
      expect(Stylist.find(lydia2.id())).to(eq(lydia2))
    end
  end

  describe('#clients') do
    it('returns an array of clients for a particular stylist') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      lydia.save()
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia.id()})
      maurice.save()
      steffan = Client.new({:name => 'Steffan', :id => nil, :stylist_id => lydia.id()})
      steffan.save()
      expect(lydia.clients()).to(eq([maurice, steffan]))
    end
  end

  describe('#update') do
    it('updates stylists in the database') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      lydia.save()
      lydia.update({:name => 'Christine'})
      expect(lydia.name()).to(eq('Christine'))
    end
  end

  describe('#delete') do
    it('deletes a stylist from the database') do
      lydia1 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia1.save()
      lydia2 = Stylist.new({:name => 'Lydia', :id => nil})
      lydia2.save()
      lydia1.delete()
      expect(Stylist.all()).to(eq([lydia2]))
    end

    it('deletes associated clients when a stylist is deleted') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      lydia.save()
      maurice = Client.new({:name => 'Maurice', :id => nil, :stylist_id => lydia.id()})
      maurice.save()
      steffan = Client.new({:name => 'Steffan', :id => nil, :stylist_id => lydia.id()})
      steffan.save()
      lydia.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
