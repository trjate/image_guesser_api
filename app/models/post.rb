class Post < ActiveRecord::Base
  has_many :guesses
  belongs_to :user
  validates :image_url, :answer, presence: true


end

