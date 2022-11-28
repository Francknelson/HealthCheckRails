require 'rails_helper'

RSpec.describe Clinic, type: :model do
  subject(:clinic) { build :clinic }

  describe "associations" do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_many(:professionals).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:clients).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:appointments).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:clinic_specialties).dependent(:destroy).inverse_of(:clinic) }
    it { is_expected.to have_many(:specialties).through(:clinic_specialties) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:corporate_name) }
    it { is_expected.to validate_presence_of(:cnpj) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:corporate_name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:cnpj).of_type(:string).with_options(null: false) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
