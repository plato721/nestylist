class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, uniqueness: { scope: :user,
    message: "must be unique"
  }
end
