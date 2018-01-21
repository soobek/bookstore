class User < ApplicationRecord

  has_many :books, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  enum user_role: [:admin, :user]

  validates :nick,
    :presence => {:in => true, :message => " can't be empty!"},
    :length => {:within => 4..25,
    :message => " length should be between 4 and 25 characters!"}

ratyrate_rater

end
