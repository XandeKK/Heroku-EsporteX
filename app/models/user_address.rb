class UserAddress < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :state
end
