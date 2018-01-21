class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  has_attached_file :picture,
         :styles => {:medium => "300x300>", :thumb => "50x50>" }

  mount_uploader :bookfile, BookfileUploader
  
  validates :title,
    :presence => {:in => true, :message => " can't be empty!"},
    :length => {:within => 4..250,
    :message => " length should be between 4 and 25 characters!"}

  validates :description,
    :presence => {:in => true, :message => " can't be empty!"},
    :length => {:maximum => 950, :message => " field has too many characters!"}

  validates :text,
    :presence => {:in => true, :message => " can't be empty!"}

  validates_attachment_content_type :picture,
    content_type: ["image/jpeg", "image/gif", "image/png"] , 
    :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'
  validates_attachment_size :picture, less_than: 1.megabytes, 
    :message => '--- za duży plik max rozmiar to 1 MB ----'

ratyrate_rateable 'original_score'

def self.search(search)
  if search
    where("title like ?", "%"+search+"%")
  else
    order('title ASC')
  end
end
end
