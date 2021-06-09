require 'rails_helper'

RSpec.describe Document, type: :model do
    describe 'create and update' do
        describe 'it tests document creation' do
            it do
                document = Document.create(name: 'Doc', shared: true)
                expect(document.name).to eq('Doc')
                expect(document.shared).to eq(true)
            end
        end
        describe 'it tests document updation' do
            it do
                document = Document.create(name: 'Doc', shared: true)
                document.update('name': 'Docs', shared: false)
                expect(document.name).to eq('Docs')
                expect(document.shared).to eq(false)
            end
        end
    end
end
    