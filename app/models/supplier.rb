require 'open-uri'
class Supplier < ApplicationRecord
  after_save :clear_cache

  def fetch_cheapest_from_url
    data = URI.parse(url).read
    JSON.parse(data).sort{|a, b| a[1]<=>b[1]}.first + [name]
  end

  def clear_cache
    Rails.cache.delete(@md5_key)
  end
end
