class Book < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_attached_file :picture,
		                :styles => {:medium => "600x600>", :thumb => "200x200>" }

	validates :title,
  	:presence => { :message => " can't be empty!"},
  	:length => {:within => 4..250, :message => " length should be between 4 and 25 characters!"}

	validates :description,
  	:presence => { :message => " can't be empty!"},
  	:length => {:maximum => 950, :message => " field has too many characters!"}

	validates :text, :presence => { :message => " can't be empty!" }

	validates_attachment_content_type :picture,
    content_type: ["image/jpeg", "image/gif", "image/png"] ,
    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'
  validates_attachment_size :picture, less_than: 1.megabytes,
  	:message => '--- za duży plik max rozmiar to 1 MB ----'
end
