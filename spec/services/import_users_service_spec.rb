require 'rails_helper'

describe Users::ImportUsersService, type: :service do
  let(:operation) { described_class }
  let(:file) { Rails.root.join("public", "testRails.csv") }

  describe '#new' do
    context 'with valid data' do
      it 'create user on csv file correctly' do
        created = operation.new(file).call
        expect(created).to be true
      end
    end
  end
end