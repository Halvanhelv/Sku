# frozen_string_literal: true

require 'rails_helper'

def response_json(file_name)
  File.read(Rails.root.join('spec', file_name.to_s))
end
