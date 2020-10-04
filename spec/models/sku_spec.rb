# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sku, type: :model do
  it { is_expected.to validate_presence_of :product_id }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :brand }
  it { is_expected.to validate_presence_of :index }
  it { is_expected.to validate_presence_of :availability }
  it { is_expected.to validate_presence_of :final_price }
  it { is_expected.to validate_presence_of :category }
  it { is_expected.to validate_presence_of :brand }
  it { is_expected.to validate_presence_of :delivery_schema }

  it { is_expected.to have_db_column :product_id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :brand }
  it { is_expected.to have_db_column :index }
  it { is_expected.to have_db_column :availability }
  it { is_expected.to have_db_column :final_price }
  it { is_expected.to have_db_column :category }
  it { is_expected.to have_db_column :brand }
  it { is_expected.to have_db_column :delivery_schema }
end
