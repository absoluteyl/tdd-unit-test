require 'tennis'

RSpec.describe Tennis, "#score" do
  context "when game start" do
    it "should return love all" do
      tennis = Tennis.new()
      expect(tennis.score()).to eq("Love All")
    end
  end

end
