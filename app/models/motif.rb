class Motif < ApplicationRecord
    validates_presence_of :reason 
    has_many :demandes, dependent: :destroy 
  end