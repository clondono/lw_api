require 'rails_helper'

describe Visit do
  let(:visit) { FactoryGirl.build :visit }
  subject { visit }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:subscriptionPlan) }
  it { should respond_to(:userId) }
  it { should respond_to(:friendCount) }


end

