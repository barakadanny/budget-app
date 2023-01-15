class CategoriesTransaction < ApplicationRecord
  belongs_to :transaction
  belongs_to :category
end
