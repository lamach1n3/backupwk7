class Building < ApplicationRecord
    belongs_to :customer ,optional: true
    has_many :batteries
    has_one :building_details
end
