require 'spec_helper'

describe RefereeRequest do
  
  before(:each) do
    @request = RefereeRequest.new(:name => 'John Doe', :email => 'john.doe@yahoo.com')
  end

  context "when validating" do
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }

  end

end
