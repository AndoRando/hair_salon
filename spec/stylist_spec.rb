require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('returns the name of a stylist') do
      lydia = Stylist.new({:name => 'Lydia', :id => nil})
      expect(lydia.name()).to(eq('Lydia'))
    end
  end
end
