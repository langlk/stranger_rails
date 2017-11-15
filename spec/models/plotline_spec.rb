require "rails_helper"

describe Plotline do
  it { should validate_presence_of :name }

  it { should have_many :scenes }
  it { should have_many :episodes }
end
