class Position < ApplicationRecord
  validates :position_title, presence: true, uniqueness: { case_sensitive: false }
  validates :salary, presence: true, numericality: { greater_than: 0 }

  has_many :employees, dependent: :nullify
end
