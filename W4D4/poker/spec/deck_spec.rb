require 'deck'
require 'rspec'

describe Deck do
    subject(:deck) { Deck.new }
    describe "#initialize" do
        it "instantiates the deck correctly with 52 unique cards" do
            expect(deck.deck.length).to be(52)
            expect(deck.deck.all? {|card| card.is_a?(Card)}).to be(true)
            expect(deck.deck).to eq(deck.deck.uniq)
        end

    end

end