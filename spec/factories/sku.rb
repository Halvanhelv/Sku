# frozen_string_literal: true

FactoryBot.define do
  factory :sku do
    title { '1' }
    index { '1' }
    availability { 1 }
    price { 123 }
    final_price { 122 }
    delivery_schema { 'Ratail' }
    category { 'Electronics' }
    brand { 'Samsung' }
    sequence(:product_id) { |n| n }
  end
end
