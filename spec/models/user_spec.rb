require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    describe 'it validates username' do
        it do
            user = User.create(username: '', password: "")
            expect(user.errors[:username]).to be_present
            expect(user.errors[:password]).to be_present
          end
    
    end
  end
  describe 'check assigned values' do
    it do
        user = User.create(username: 'qwerty', password: "1234", name: "Pola", email: "t@g.co")
        expect(user.name).to eq('Pola')
        expect(user.email).to eq('t@g.co')
        expect(user.username).to eq('qwerty')
        expect(user.password).to eq('1234')

      end

  end
  describe 'check updtes' do
    it do
      user = User.create(username: 'qwerty', password: "1234", name: "Pola", email: "t@g.co")
      user.update(name: "Hola", email: "p@g.co")
      expect(user.name).to eq('Hola')
      expect(user.email).to eq('p@g.co')
    end
  end

end
