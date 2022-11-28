require 'rails_helper'

RSpec.describe Address, type: :model do
  subject(:address) { build :address }

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:zipcode).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:street).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:number).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:complement).of_type(:string) }
    it { is_expected.to have_db_column(:neighborhood).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:city).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:state).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
