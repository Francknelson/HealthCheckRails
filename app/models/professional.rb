class Professional < Person
  validates :professional_record,
            :person,
            :specialty,
            presence: true

  belongs_to :person

  has_many :specialty

end
