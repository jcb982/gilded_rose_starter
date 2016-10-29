require_relative '../lib/gilded_rose'

describe "#update_quality" do

  context "with a single item" do

    # let statements are a helper so you instantiate a new item simply. Instead of doing
    # item = Item.new(...) in each test, you can just refer to an 'item'
    let(:item) { Item.new('item', 5, 10) }
    let(:item_to_be_corrected) { Item.new('item', 4, 100) }

    # it -> a statement that is true
    it "While sell_in is greater than 0, sell_in and quality degrade by 1 per day" do
      # we know our item has a sell in date of 5 and a quality of 10
      # so we update it
      update_quality([item])
      # and then assert that the sell in has decreminted by one
      expect(item.sell_in).to eq(4)
      # along with the quality
      expect(item.quality).to eq(9)
    end

    it "After sell_in is less than 0, quality degrades by 2 per day"

    it "quality can not drop below 0"

    it "except for Sulfuras, quality cannot exceed 50"

  end

  context 'with conjured items' do

    let(:conjured_item) { Item.new('Conjured item', 1, 8) }

    it "While sell_in is greater than 0, sell_in and quality degrade by 2 per day"

    it "After sell_in is less than 0, quality degrades by 4 per day" 

  end

  context 'with Sulfuras, Hand of Ragnaros' do

    let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', 5, 80) }

    it "Sulfuras quality is always 80; quality and sell_in never degrade" 

  end

  context 'with backstage passes' do

    let(:backstage_passes) { Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 12) }

    it "While sell_in is greater than 10, quality increases by 1 per day" 

    it "While sell_in is greater than or equal to 10 and less than 5, quality increases by 2 per day" 

    it "While sell_in is less than or equal to 5 and greater than 0, quality increases by 3 per day" 

    it "When sell_in is less than 0, quality drops to 0" 

  end

  context 'with aged brie' do

    let(:aged_brie) { Item.new('Aged Brie', 3, 48) }

    it "quality increased by one per day" 

    it "quality cannot increase past 50" 

  end

  context "with multiple items" do
    let(:items) {
      [
        Item.new("Aged Brie", 3, 10),
        Item.new("NORMAL ITEM", 5, 10),
      ]
    }

    # before statements get run before every test. So, since there is a before 
    # statement here, you would not need to do an update_quality(...) in the test
    before { update_quality(items) }

    it "processes multiple items normally when they're passed in as an array" 

  end

end
