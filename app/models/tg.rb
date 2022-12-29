class Tg < ApplicationRecord
  belongs_to :project
  has_many :tgers, dependent: :destroy
  
end
