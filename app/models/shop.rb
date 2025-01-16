class Shop < ApplicationRecord
  has_many :line_item_dates, dependent: :destroy

  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :asc) }

  broadcasts_to ->(shop) { [ shop.company, "shops" ] }, inserts_by: :prepend, partial: "shops/shop_without_devise"
end
