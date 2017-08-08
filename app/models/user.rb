class User < ActiveRecord::Base
  has_many  :posts
  has_many  :comments
  has_many  :mylists
  has_many  :myplans
  
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
  acts_as_mentionable
  # Socialization gem, created by Jeong Taek Han
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
