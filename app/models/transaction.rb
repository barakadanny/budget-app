class Transaction < ApplicationRecord
    validates :name, presence: true
    validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :user_id, presence: true

    belongs_to :user
    # scope :for_group, ->(group_id) { where(group_id: group_id) }
  end