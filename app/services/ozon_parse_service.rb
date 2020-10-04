# frozen_string_literal: true

class OzonParseService
  attr_reader :url

  def initialize(url)
    @url = url.to_s
  end

  def parse
    1.upto(page_count) do |i|
      answer = JSON.parse(fetch_page("#{url}&page=#{i}").body)
      answer['catalog']['searchResultsV2'].values.last['items'].each do |item|
        create_or_update(item)
      end
    end
  end

  private

  def create_or_update(item)
    Sku.where(product_id: item['cellTrackingInfo']['id'])
       .first_or_initialize.update(prepare_data(item))
  end

  def fetch_page(url)
    Faraday.get(url)
  rescue Exception => e
    raise "Excepted with #{e}"
  end

  def page_count
    total_counts = JSON.parse(fetch_page(url).body)
    products_on_one_page = total_counts['catalog']['searchResultsV2'].values.last['items'].count
    total_counts = total_counts['catalog']['catalogResultsHeader'].values.last['cellTrackingInfo']['countItems']
    total_counts.fdiv(products_on_one_page).ceil
  end

  def prepare_data(item_hash)
    item = item_hash['cellTrackingInfo']
    {
      availability: item['availability'],
      price: item['price'],
      index: item['index'],
      final_price: item['finalPrice'],
      delivery_schema: item['deliverySchema'],
      category: item['category'],
      brand: item['brand'],
      title: item['title']
    }
  end
end
