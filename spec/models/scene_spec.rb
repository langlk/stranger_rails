require "rails_helper"

describe Scene do
  it { should validate_presence_of :episode }
  it { should validate_presence_of :description }
  it { should validate_presence_of :plotline }

  it { should belong_to :episode }
  it { should belong_to :plotline }

  describe ".intersect" do
    it "should return the scenes that belong to both the plotline and the episode provided" do
      e1 = Episode.create(title: "Test1", season: 1, number: 1)
      e2 = Episode.create(title: "Test2", season: 2, number: 2)
      p1 = Plotline.create(name: "Test1", description: "Test1")
      p2 = Plotline.create(name: "Test2", description: "Test2")
      s1 = Scene.create(description: "Test1", plotline_id: p1.id, episode_id: e1.id)
      s2 = Scene.create(description: "Test2", plotline_id: p2.id, episode_id: e2.id)
      expect(Scene.intersect(p1, e1)).to eq([s1])
      expect(Scene.intersect(p2, e2)).to eq([s2])
    end
  end
end
