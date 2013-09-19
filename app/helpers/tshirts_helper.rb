module TshirtsHelper
  def price(float)
    (float.respond_to? :to_f) ? sprintf("$%.2f",float.to_f) : 'unknown'
  end

  def pretty_title(tshirt)
    "#{tshirt.name}  - #{tshirt.size} (#{price(tshirt.price)})"
  end
end
