class Order < ApplicationRecord
    belongs_to :user
    has_many :couriers
    has_many :delivered_by, through: :couriers, source: :user
end
