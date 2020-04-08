class Room < ApplicationRecord
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :chats
end
