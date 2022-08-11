class Demande < ApplicationRecord
  enum status: [:encours, :refused, :accepted]
  belongs_to :motif
end
