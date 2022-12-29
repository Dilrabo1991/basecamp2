class Project < ApplicationRecord
  belongs_to :user
  has_many :yuks, dependent: :destroy
  has_many :tgs, dependent: :destroy
  has_many :ishbers, dependent: :destroy
end
