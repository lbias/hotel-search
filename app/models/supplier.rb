require 'open-uri'
class Supplier < ApplicationRecord
  def fetch_cheapest_from_url
    data = URI.parse(url).read
    JSON.parse(data).sort{|a, b| a[1]<=>b[1]}.first + [name]
  end
end
