class Tag < ActiveRecord::Base
  has_many :ticket_tags, foreign_key: :tag_id
  has_many :tickets, through: :ticket_tags
end
