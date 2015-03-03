require 'rails_helper'

 describe PageView do
 before { @page_view = FactoryGirl.build(:page_view) }

 subject { @page_view }

 it { should respond_to(:userId) }
 it { should respond_to(:path) }
 it { should respond_to(:referrer) }
 it { should respond_to(:title) }
 it { should respond_to(:url) }

 it { should be_valid }

  it { should validate_presence_of(:userId) }
  it { should validate_presence_of(:url) }
 it { should validate_presence_of(:title) }

	describe ".filter_by_referrer" do
    before(:each) do
      @page_view1 = FactoryGirl.create :page_view, referrer: "A plasma TV", userId: "user123", title: "Title", url: "www.com"
      @page_view2 = FactoryGirl.create :page_view, referrer: "Fastest Laptop", userId: "user123", title: "Title", url: "www.com"
      @page_view3 = FactoryGirl.create :page_view, referrer: "CD player", userId: "user123", title: "Title", url: "www.com"
      @page_view4 = FactoryGirl.create :page_view, referrer: "LCD TV", userId: "user123", title: "Title", url: "www.com"

    end

    context "when a 'TV' referrer pattern is sent" do
      it "returns the 2 page_views matching" do
        expect(PageView.filter_by_referrer("TV")).to have(2).items
      end

      it "returns the page_views matching" do
        expect(PageView.filter_by_referrer("TV").sort).to match_array([@page_view1, @page_view4])
      end
    end
  end

	describe ".filter_by_time" do
    before(:each) do
      @page_view1 = FactoryGirl.create :page_view, referrer: "A plasma TV", userId: "user123", title: "Title", url: "www.com", created_at: DateTime.parse("2012-02-27 00:00:00")
      @page_view2 = FactoryGirl.create :page_view, referrer: "Fastest Laptop", userId: "user123", title: "Title", url: "www.com", created_at: DateTime.parse("2013-02-27 00:00:00")
      @page_view3 = FactoryGirl.create :page_view, referrer: "CD player", userId: "user123", title: "Title", url: "www.com", created_at: DateTime.parse("2014-02-27 00:00:00")
      @page_view4 = FactoryGirl.create :page_view, referrer: "LCD TV", userId: "user123", title: "Title", url: "www.com", created_at: DateTime.parse("2015-02-27 00:00:00")

    end

    context "when a between 2013-2015' created_at time is sent" do
      it "returns the 2 page_views matching" do
        expect(PageView.filter_by_date("2013-01-01 00:00:00", "2015-01-01 00:00:00")).to have(2).items
      end

      it "returns the page_views matching" do
        expect(PageView.filter_by_date("2013-01-01 00:00:00", "2015-01-01 00:00:00").sort).to match_array([@page_view2, @page_view3])
      end
    end
  end
end
