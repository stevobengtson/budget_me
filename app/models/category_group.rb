# frozen_string_literal: true
class CategoryGroup < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true
  validates :name, uniqueness: {scope: :user, message: 'Category group names should be unique'}
end
