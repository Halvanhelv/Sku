# frozen_string_literal: true

require 'rails_helper'
RSpec.describe OzonParseService do
  let(:ozon_json) { double(body: response_json('ozon.json')) }
  let(:ozon_json_item) { JSON.parse(ozon_json.body)['catalog']['searchResultsV2'].values.last['items'][0]['cellTrackingInfo'] }

  subject { OzonParseService.new('https://api.ozon.ru/composer-api.bx/page/json/v1?url=/category/televizory-15528') }

  describe '#parse' do

      it 'ozon server return json' do
        allow(Faraday).to receive(:get).and_return(ozon_json)
        subject.parse
      end

      context 'new record in the database' do
        it 'request added to db' do
          allow(Faraday).to receive(:get).and_return(ozon_json)
          expect { subject.parse }.to change(Sku, :count).by(1)
        end
      end

      context 'update record in database' do
        let!(:ozon_json_2) { create(:sku, product_id: ozon_json_item['id']) }

        it 'updated existed column' do
          allow(Faraday).to receive(:get).and_return(ozon_json)
          subject.parse
          expect(ozon_json_2.reload.price).to eq ozon_json_item['price']
        end
      end

  end
end
