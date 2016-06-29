class AddUsersTable < ActiveRecord::Migration
  def change
    create_table "users", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.string   "password_digest"
    end
  end
end
