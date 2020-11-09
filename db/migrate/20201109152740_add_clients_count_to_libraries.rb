# frozen_string_literal: true

class AddClientsCountToLibraries < ActiveRecord::Migration[6.0]
  def change
    add_column :libraries, :clients_count, :integer
  end
end
