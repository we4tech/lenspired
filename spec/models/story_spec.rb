require 'rails_helper'

RSpec.describe Story, type: :model do
  context 'with invalid object' do
    let(:invalid) { described_class.new.tap(&:save) }

    %w|title description|.each do |attr|
      it "requires #{attr}" do
        expect(invalid.errors[attr]).to be_present
      end
    end

    describe '#title' do
      it 'requires at least 2 characters' do
        inst = described_class.new(title: 'a')
        expect(inst.valid?).to be == false
        expect(inst.errors[:title].first).to match /is too short/
      end

      it 'accepts maximum 255 chars' do
        inst = described_class.new(title: ('a') * 266)
        expect(inst.valid?).to be == false
        expect(inst.errors[:title].first).to match /is too long/
      end
    end
  end
end
