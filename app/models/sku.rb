# frozen_string_literal: true

class Sku < ApplicationRecord
  validates :index, :title, :availability, :price, :final_price, :delivery_schema, :category, :brand, :product_id, presence: true
end
