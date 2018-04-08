class Ticket < ActiveRecord::Base
  belongs_to :project, foreign_key: :project_id
  has_many :ticket_tags, foreign_key: :ticket_id
  has_many :tags, through: :ticket_tags
end
