class GroupProduct < ApplicationRecord
  belongs_to :groups
  belongs_to :entities
end
