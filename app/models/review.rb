class Review < ApplicationRecord
  belongs_to :game, dependent: :destroy
end
