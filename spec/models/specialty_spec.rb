require 'rails_helper'

RSpec.describe Specialty, type: :model do
  subject(:specialty) { build :specialty }

  describe "associations" do
    it { is_expected.to have_many(:professional_specialties).dependent(:destroy) }
    it { is_expected.to have_many(:professionals).through(:professional_specialties) }
    it { is_expected.to have_many(:clinic_specialties).dependent(:destroy) }
    it { is_expected.to have_many(:clinics).through(:clinic_specialties) }
  end

  describe "validations" do
    it { is_expected.to validate_uniqueness_of(:description).case_insensitive }
  end

  describe "database" do
    it { is_expected.to have_db_column(:description).of_type(:string).with_options(null: false) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
