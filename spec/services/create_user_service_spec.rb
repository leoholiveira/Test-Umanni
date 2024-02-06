require 'rails_helper'

describe Users::CreateUserService, type: :service do
  let(:operation) { described_class }

  let(:valid_attributes) {{
    user: {
      fullname: Faker::Name.name,
      email: Faker::Internet.email,
      user_type: User.user_types.keys.sample,
      avatar_image: Faker::LoremFlickr.image,
      password: 123456,
      confirmation_password: 123456
    }
  }}

  describe '#perform' do
    context 'with valid data' do
      it 'create attraction correctly' do
        params = ActionController::Parameters.new(valid_attributes)
        created = operation.new(params).call
        expect(created).to_not be_nil
      end
    end
  end
end