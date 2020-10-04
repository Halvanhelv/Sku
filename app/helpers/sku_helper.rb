# frozen_string_literal: true

module SkuHelper
  def products(sku)
    sku.map do |product|
      content_tag :div, product.title
    end.join.html_safe
  end
end
