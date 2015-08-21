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
end
