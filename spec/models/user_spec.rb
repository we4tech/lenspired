require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with missing attributes' do
    let(:invalid) { User.create }

    %i(name email password).each do |field|
      it "requires #{field} attribute" do
        expect(invalid.errors[field]).to be_present
      end
    end
  end

  context 'with required attributes' do
    it 'creates user' do
      expect { FactoryGirl.create :user }.to change(User, :count)
    end
  end
end
