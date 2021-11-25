require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  subject do
    user
  end

  describe 'GET #index' do
    it { should have_many(:entities).without_validating_presence }
    it { should have_many(:groups).without_validating_presence }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
