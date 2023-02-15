# frozen_string_literal: true

# This migration comes from devise (originally 20170806125915)
class AddFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :full_name, :string
  end
end
