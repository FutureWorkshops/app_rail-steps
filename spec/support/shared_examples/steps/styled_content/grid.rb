# frozen_string_literal: true

shared_examples_for "styled_content_grid" do |_param|
  describe "#ar_styled_content_grid_large_section" do
    let(:result) { subject.ar_styled_content_grid_large_section(id: 0, text: "Mountains") }

    context "ok" do
      it { expect(result[:id]).to eq 0 }

      it { expect(result[:text]).to eq "Mountains" }

      it { expect(result[:type]).to eq :largeSection }
    end
  end

  describe "#ar_styled_content_grid_small_section" do
    let(:result) { subject.ar_styled_content_grid_small_section(id: 0, text: "Mountains") }

    context "ok" do
      it { expect(result[:id]).to eq 0 }

      it { expect(result[:text]).to eq "Mountains" }

      it { expect(result[:type]).to eq :smallSection }
    end
  end

  describe "#ar_styled_content_grid_item" do
    context "url" do
      let(:result) do
        subject.ar_styled_content_grid_item(id: 0, text: "Mountains", detail_text: "Beautiful landscape",
                                            preview_url: "https://test.com/image")
      end

      it { expect(result[:id]).to eq 0 }

      it { expect(result[:text]).to eq "Mountains" }

      it { expect(result[:detailText]).to eq "Beautiful landscape" }

      it { expect(result[:type]).to eq :item }

      it { expect(result[:imageURL]).to eq "https://test.com/image" }
    end
  end
end
