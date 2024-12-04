class Quote < ApplicationRecord
  validates :name, presence: true

  scope :ordered, -> { order(id: :desc) }

  # def special_name
  #     "special_#{name}"
  # end
end
