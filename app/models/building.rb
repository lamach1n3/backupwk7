class Building < ApplicationRecord
    belongs_to :customer
    has_one :battery
    has_one :building_detail
    has_one :address
end
