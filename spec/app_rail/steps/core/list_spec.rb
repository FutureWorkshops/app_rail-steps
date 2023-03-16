# frozen_string_literal: true

RSpec.describe AppRail::Steps::Core::List do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }

  describe "#ar_core_list_item" do
    context "text" do
      let(:result) { subject.ar_core_list_item(text: "London") }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq "London" }
    end

    context "material icon" do
      let(:result) { subject.ar_core_list_item(text: "London", material_icon_name: "star") }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:materialIconName]).to eq "star" }
    end

    context "url" do
      let(:result) { subject.ar_core_list_item(text: "London", preview_url: "https://test.com/image") }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:imageURL]).to eq "https://test.com/image" }
    end

    context "section name" do
      let(:result) { subject.ar_core_list_item(text: "London", section_name: "UK") }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:sectionName]).to eq "UK" }
    end

    context "type" do
      let(:result) { subject.ar_core_list_item(text: "London", type: "io.mobileworkflow.Question") }

      it { expect(result[:id]).to eq 1 }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:type]).to eq "io.mobileworkflow.Question" }
    end
  end

  describe "#ar_core_list_search_suggestion" do
    context "text" do
      let(:result) { subject.ar_core_list_search_suggestion(id: "1", text: "London", section_name: "City") }

      it { expect(result[:id]).to eq "1" }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:sectionName]).to eq "City" }
    end
  end
end
