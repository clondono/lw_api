require 'rails_helper'

describe Purchase do
  let(:purchase) { FactoryGirl.build :purchase }
  subject { purchase }

  it { should respond_to(:revenue) }
  it { should respond_to(:userId) }
  it { should respond_to(:shippingMethod) }


end