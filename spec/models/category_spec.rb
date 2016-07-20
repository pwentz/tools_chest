require 'rails_helper'

describe Category, :type => :model do
  context "assocations" do
    it { should have_many(:tools) }
  end
end
