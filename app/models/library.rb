# frozen_string_literal: true

class Library < ApplicationRecord
  has_many :clients
end
