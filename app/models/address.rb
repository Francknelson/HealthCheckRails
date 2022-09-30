class Address < ApplicationRecord
  validates :zipcode,
            :street,
            :number,
            :neighborhood,
            :city,
            :state,
            presence: true
end
