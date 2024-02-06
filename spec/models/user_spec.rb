RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:user_type) }
    it { should define_enum_for(:user_type).with_values(client: 0, admin: 1) }
  end

  describe 'devise modules' do
    it { should have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:encrypted_password).of_type(:string).with_options(null: false) }
    it { should have_db_column(:reset_password_token).of_type(:string) }
    it { should have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { should have_db_column(:remember_created_at).of_type(:datetime) }
  end

  describe 'factory' do
    # Se você estiver usando FactoryBot ou outra fábrica, teste aqui.
    # Exemplo: it 'has a valid factory' do
    #            expect(build(:user)).to be_valid
    #          end
  end

  describe 'Devise validations' do
    # Teste Devise confirmations, unlockables, and timeouts, se aplicável.
  end
end