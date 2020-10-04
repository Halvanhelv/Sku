# frozen_string_literal: true

class SkuController < ApplicationController
  def index
    @sku = Sku.paginate(page: params[:page], per_page: 36)
  end
end
