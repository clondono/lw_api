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


end
