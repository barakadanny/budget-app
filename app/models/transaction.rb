class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :user_id, presence: true
  validates_presence_of :category_ids

  belongs_to :user
  belongs_to :group
  has_and_belongs_to_many :categories
end
