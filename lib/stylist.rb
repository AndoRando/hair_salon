class Stylist
  attr_reader(:name)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
  end

  define_method(:==) do |other_stylist|
    self.name().==(other_stylist.name())
  end
end
