require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject(:appointment) { build :appointment, return: true }

  describe "associations" do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to belong_to(:professional) }
    it { is_expected.to belong_to(:clinic) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:appointment_date) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:professional_id) }
    it { is_expected.to validate_presence_of(:clinic_id) }
    it { is_expected.to validate_presence_of(:client_id) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:appointment_date).of_type(:date).with_options(null: false) }
    it { is_expected.to have_db_column(:return).of_type(:boolean).with_options(null: false) }
    it { is_expected.to have_db_column(:status).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:professional_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:clinic_id).of_type(:integer).with_options(null: false) }
    it { is_expected.to have_db_column(:client_id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
