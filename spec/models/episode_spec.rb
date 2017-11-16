require "rails_helper"

describe Episode do
  it { should validate_presence_of :title }
  it { should validate_presence_of :season }
  it { should validate_presence_of :number }

  it { should have_many :scenes }
  it { should have_many :plotlines }
  it { should have_many :reviews }

  describe '.chronological' do
    it "returns episodes sorted by season and episode number" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1
      )
      e3 = Episode.create(
      title: "Madmax",
      season: 2,
      number: 1
      )
      e2 = Episode.create(
        title: "The Weirdo on Maple Street",
        season: 1,
        number: 2
      )
      expect(Episode.chronological).to eq([e1, e2, e3])
    end
  end

  describe '.alphabetical' do
    it "returns episodes sorted alphabetically by title" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1
      )
      e3 = Episode.create(
      title: "Madmax",
      season: 2,
      number: 1
      )
      e2 = Episode.create(
        title: "The Weirdo on Maple Street",
        season: 1,
        number: 2
      )
      expect(Episode.alphabetical).to eq([e3, e1, e2])
    end
  end

  describe '#rating' do
    it "returns the average rating across all reviews" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1
      )
      r1 = Review.create(
        episode_id: e1.id,
        content: "Test1",
        author: "Test1",
        rating: 4
      )
      r2 = Review.create(
        episode_id: e1.id,
        content: "Test2",
        author: "Test2",
        rating: 3
      )
      expect(e1.rating).to eq(3.5)
    end

    it "returns nil if no reviews" do
      e1 = Episode.create(
        title: "The Vanishing of Will Byers",
        season: 1,
        number: 1
      )
      expect(e1.rating).to eq(nil)
    end
  end
end
