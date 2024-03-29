# frozen_string_literal: true

RSpec.describe AppRail::Steps::Maps::Map do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }
  describe "#ar_maps_map_item" do
    context "text" do
      let(:result) { subject.ar_maps_map_item(text: "London", latitude: 51.5, longitude: 0.51) }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:latitude]).to eq 51.5 }
      it { expect(result[:longitude]).to eq 0.51 }
    end

    context "coordinates as string" do
      let(:result) { subject.ar_maps_map_item(text: "London", latitude: "51.5", longitude: "0.51") }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:latitude]).to eq 51.5 }
      it { expect(result[:longitude]).to eq 0.51 }
    end
  end
end
