class ClinicAddress < Address
  validates :zipcode,
            :street,
            :number,
            :neighborhood,
            :city,
            :state,
            :clinic_id,
            presence: true

  belongs_to :clinic
end
