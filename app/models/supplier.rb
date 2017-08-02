require 'open-uri'

class Supplier < ApplicationRecord
  def fetch_supplier
    uri = URI.parse(url).read
    JSON.parse(uri).map do |id, price|
      {id: id, price: price, supplier: name}
    end
  end

  def Supplier.find_by_name_of obj
    where(name: obj)
  end
end
