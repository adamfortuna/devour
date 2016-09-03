require 'kramdown'

module ApplicationHelper
  def address_for address
    a = []
    a << address.street
    a << [address.city, address.region, address.postal_code, address.country].compact.join(', ')
    a.compact.join('<br/>')
  end

  def markdown text
    Kramdown::Document.new(text).to_html
  end
end
