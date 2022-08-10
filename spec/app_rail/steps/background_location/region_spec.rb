# frozen_string_literal: true

RSpec.describe AppRail::Steps::BackgroundLocation::Region do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }
  describe "#region" do
    context "required" do
      let(:result) { subject.ar_background_location_region(id: "home", latitude: 51.2, longitude: -0.5) }

      it { expect(result[:id]).to eq "home" }
      it { expect(result[:latitude]).to eq 51.2 }
      it { expect(result[:longitude]).to eq(-0.5) }
      it { expect(result[:event]).to eq :entryAndExit }
      it { expect(result[:radius]).to eq 100 }
    end
  end
end
