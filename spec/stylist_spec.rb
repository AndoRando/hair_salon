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
end
