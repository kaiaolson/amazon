class Product < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :departments, through: :categorizations

  validates :name, presence: true,
                   uniqueness: {case_sensitive: false,
                                message: "This product already exists!"},
                   length: {minimum: 3}

  validates :price, numericality: {greater_than_or_equal_to: 0}

  def self.top_five
    where("price IS NOT NULL").order("price DESC").limit(5)
  end

  def self.sort(search_term, sort_by_column, current_page, per_page_count)
    where(["name || description ILIKE ?","%#{search_term}%"]).order("#{sort_by_column}").offset(current_page * per_page_count).limit(per_page_count)
  end

  def self.most_recent_on_sale
    where.not("sale_price = price").order("updated_at, sale_price").limit(3)
  end
end
