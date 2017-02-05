# frozen_string_literal: true
class Category < ApplicationRecord
  belongs_to :category_group

  validates :name, presence: true
  validates :category_group, presence: true
  validates :name, uniqueness: {scope: :category_group, message: 'Category names should be unique per group'}

  delegate :user, to: :category_group
  delegate :name, to: :category_group, prefix: true
end
