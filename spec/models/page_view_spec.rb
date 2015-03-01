require 'rails_helper'

RSpec.describe PageView, type: :model do
 before { @page_view = FactoryGirl.build(:page_view) }

 subject { @page_view }

 it { should respond_to(:userId) }
 it { should respond_to(:path) }
 it { should respond_to(:referrer) }
 it { should respond_to(:title) }
 it { should respond_to(:url) }

 it { should be_valid }
end
