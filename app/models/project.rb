class Project < ActiveRecord::Base
  has_many :tickets, foreign_key: :project_id
  validates :name, presence: true
end
