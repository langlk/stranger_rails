require "rails_helper"

describe Episode do
  it { should validate_presence_of :title }
  it { should validate_presence_of :season }
  it { should validate_presence_of :number }
  it { should validate_presence_of :rating }

  describe '.chronological' do
    it "returns episodes sorted by season and episode number" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1,
        rating: 4
      )
      e3 = Episode.create(
      title: "Madmax",
      season: 2,
      number: 1,
      rating: 4
      )
      e2 = Episode.create(
        title: "The Weirdo on Maple Street",
        season: 1,
        number: 2,
        rating: 4
      )
      expect(Episode.chronological).to eq([e1, e2, e3])
    end
  end

  describe '.alphabetical' do
    it "returns episodes sorted alphabetically by title" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1,
        rating: 4
      )
      e3 = Episode.create(
      title: "Madmax",
      season: 2,
      number: 1,
      rating: 4
      )
      e2 = Episode.create(
        title: "The Weirdo on Maple Street",
        season: 1,
        number: 2,
        rating: 4
      )
      expect(Episode.alphabetical).to eq([e3, e1, e2])
    end
  end
end
