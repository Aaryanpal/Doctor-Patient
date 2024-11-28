class Patient < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "created_by", optional: true
  scope :latest, -> { order(created_at: :desc) }
end
