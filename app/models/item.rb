# create_table "items", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.bigint "user_id"
#   t.index ["user_id"], name: "index_items_on_user_id"
# end
class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, uniqueness: { scope: :user,
    message: "must be unique", case_sensitive: false
  }

  scope :items_for, ->(user) {
    where(user: user)
  }
end
