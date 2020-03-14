class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, uniqueness: { scope: :user,
    message: "must be unique", case_sensitive: false
  }

  scope :items_for, ->(user) {
    where(user: user)
  }
end
