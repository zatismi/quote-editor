class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :ensure_company, if: -> { company.blank? }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  def ensure_company
    self.company ||= Company.create(name: "Company of the People")
    debugger
  end

  def name
    email.split("@").first.capitalize
  end
end
