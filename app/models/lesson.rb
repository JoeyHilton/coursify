class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :comments, dependent: :destroy
  has_many :links, dependent: :destroy
end
