class Lesson < ActiveRecord::Base
  has_many :words, dependent: :destroy
  belongs_to :category
end
