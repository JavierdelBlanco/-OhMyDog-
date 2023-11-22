class HistoriaC < ApplicationRecord
  belongs_to :perrito
  has_one :castracion
  has_many :vacuna_e
  has_many :vacuna_r
  has_many :desparasitacion
  has_many :ambulatorium
end
