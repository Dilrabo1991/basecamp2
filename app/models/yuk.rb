class Yuk < ApplicationRecord
  belongs_to :project
  has_one_attached :yuker
end
