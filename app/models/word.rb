class Word < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :category
end
