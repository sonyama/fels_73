class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :category

  scope :by_category, -> (category_id) { where category_id: category_id }
  scope :take_all, ->content{where("id IN(SELECT id FROM words)")}
  scope :alphabet, ->content{where("id IN(SELECT id FROM words)").order("content")}
end
