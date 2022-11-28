require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build :user }

  describe "associations" do
    it { is_expected.to have_one(:professional).dependent(:restrict_with_error) }
    it { is_expected.to have_one(:clinic).dependent(:restrict_with_error) }
    it { is_expected.to have_one(:client).dependent(:restrict_with_error) }

    it { is_expected.to have_many(:addresses).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe "database" do
    it { is_expected.to have_db_column(:email).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:name).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:phone).of_type(:string) }
    it { is_expected.to have_db_column(:user_type).of_type(:string) }
    it { is_expected.to have_db_column(:password_salt).of_type(:string).with_options(null: false) }
    it { is_expected.to have_db_column(:password_hash).of_type(:string).with_options(null: false) }


    it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end
end
