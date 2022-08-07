class Demande < ApplicationRecord
  enum status: [:encours, :refused, :accepted]
end
