class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :transaction_categories

  validates :name, presence: true
end
