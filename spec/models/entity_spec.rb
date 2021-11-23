require 'rails_helper'
require_relative '../../app/models/user'

RSpec.describe Entity, type: :model do
  let(:user) { FactoryBot.create(:user_with_entities) }

  subject do
    described_class.new(user_id: :user)
  end

  it { should belong_to(:user).without_validating_presence }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a user_id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  describe 'association' do
    context 'has-many groups' do
      subject { FactoryBot.build :entity_with_groups, groups_count: 3 }

      it 'expected to have 3 groups' do
        expect(subject.groups.length).to be 3
      end
    end
  end
end
