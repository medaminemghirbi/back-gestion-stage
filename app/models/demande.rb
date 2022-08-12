class Demande < ApplicationRecord
  enum status: [:encours, :refused, :accepted]
  belongs_to :motif
  belongs_to :user, class_name: 'User', foreign_key: 'user_id', optional: true
end
