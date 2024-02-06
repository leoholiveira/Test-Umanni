require 'rails_helper'

describe Users::DeleteUserService, type: :service do
  let(:operation) { described_class }

  let(:user) { create(:user) }

  describe '#new' do
    context 'with valid data' do
      it 'delete user correctly' do
        created = operation.new(user.id).call
        expect(created).to_not be_nil
      end
    end
  end
end