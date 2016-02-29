class Categorization < ActiveRecord::Base
  belongs_to :product
  belongs_to :department

  validates :product_id, uniqueness: {scope: :department_id}
end
