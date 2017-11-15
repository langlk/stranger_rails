require "rails_helper"

describe Episode do
  it { should validate_presence_of :title }
  it { should validate_presence_of :season }
  it { should validate_presence_of :number }
  it { should validate_presence_of :rating }
end
