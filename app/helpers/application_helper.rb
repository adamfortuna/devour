module ApplicationHelper
  def address_for address
    a = []
    a << address.street
    a << [address.city, address.region, address.postal_code].compact.join(', ')
    a << address.country
    a.compact.join('<br/>')
  end
end
