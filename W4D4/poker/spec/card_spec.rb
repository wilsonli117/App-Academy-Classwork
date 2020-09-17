require 'card'
require 'rspec'

describe Card do 
    subject(:card) {Card.new(:J, :hearts)}

    describe '#initialize' do 
        context 'with valid arguments'
            it 'instantiates a card correctly with a face and a suit' do
                expect(card.face).to be(:J)
                expect(card.suit).to be(:hearts)
            end
        context 'with invalid arguments' do
            it 'should raise an error if face or suit are not valid' do
                expect { Card.new("Not a Card", :notasuit) }.to raise_error("Not a valid card")
            end
        end
    end



end