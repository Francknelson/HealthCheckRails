require 'rails_helper'

RSpec.describe Professional, type: :model do
  subject(:professional) { build :professional }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:clinic) }

    it { is_expected.to have_many(:appointments).dependent(:restrict_with_error) }
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
    it { is_expected.to have_many(:professional_specialties).dependent(:destroy).inverse_of(:professional) }
    it { is_expected.to have_many(:specialties).through(:professional_specialties) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:professional_record) }
    it { is_expected.to validate_presence_of(:clinic_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:professional_record).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:clinic_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer).with_options(null: false) }


    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
