class Post < ApplicationRecord
	validates :title, :author, :content, presence: true
	validates_length_of :content, :minimum => 50
end
