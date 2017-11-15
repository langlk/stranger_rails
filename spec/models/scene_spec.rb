require "rails_helper"

describe Scene do
  it { should validate_presence_of :episode }
  it { should validate_presence_of :description }
  it { should validate_presence_of :plotline }

  it { should belong_to :episode }
  it { should belong_to :plotline }
end
