class TicketTag < ActiveRecord::Base
  belongs_to :ticket, foreign_key: :ticket_id
  belongs_to :tag, foreign_key: :tag_id
end
