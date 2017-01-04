require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double('chef', name: 'Michael') }
  let(:cookie) { Dessert.new('cookie', 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq('cookie')
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("chocolate", "non-integer", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cookie.add_ingredient('chocolate chips')).to eq(['chocolate chips'])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ['milk', 'chocolate', 'butter'].each do |ingredient|
        cookie.add_ingredient(ingredient)
      end

      expect(cookie.mix!).to include('milk', 'chocolate', 'butter')
      expect(cookie.mix!.sort).to eq(['milk', 'chocolate', 'butter'].sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(cookie.eat(10)).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(60) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Michael the Great Baker')
      expect(cookie.serve).to eq('Chef Michael the Great Baker has made 50 cookies!')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
