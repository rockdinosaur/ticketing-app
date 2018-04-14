class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  belongs_to :assignee, foreign_key: "assignee_id", class_name: "User"

  has_many :ticket_tags, dependent: :destroy
  has_many :tags, through: :ticket_tags, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
