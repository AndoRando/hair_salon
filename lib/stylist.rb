class Stylist
  attr_reader(:name)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
  end
end
