# frozen_string_literal: true

shared_examples_for "background_location_region" do |_param|
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
