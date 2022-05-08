class Game < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  belongs_to :city
  belongs_to :state
end
