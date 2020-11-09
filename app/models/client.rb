# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :library, counter_cache: true
end
