class AddBookAvailability < ActiveRecord::Migration
  def change
    add_column :books, :status, :string, default: "available"
  end
end
