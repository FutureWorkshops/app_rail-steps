# frozen_string_literal: true

RSpec.describe AppRail::Steps::Core::Stack do
  subject { test_struct.new(id) }

  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  describe "#ar_core_stack_text" do
    context "text and label" do
      let(:result) { subject.ar_core_stack_text(text: "London", label: "City") }

      it { expect(result[:type]).to eq :text }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:label]).to eq "City" }
    end

    context "text and icons" do
      let(:result) { subject.ar_core_stack_text(text: "London", sf_symbol_name: "map", material_icon_name: "map") }

      it { expect(result[:type]).to eq :text }
      it { expect(result[:text]).to eq "London" }
      it { expect(result[:sfSymbolName]).to eq "map" }
      it { expect(result[:materialIconName]).to eq "map" }
      it { expect(result[:label]).to be_nil }
    end
  end

  describe "#ar_core_stack_image" do
    context "url" do
      let(:result) { subject.ar_core_stack_image(image_url: "https://test.com/preview", full_screen_image_url: "https://test.com/attachment") }

      it { expect(result[:type]).to eq :image }
      it { expect(result[:contentMode]).to eq "scaleAspectFill" }
      it { expect(result[:previewURL]).to eq "https://test.com/preview" }
      it { expect(result[:fullScreenImageURL]).to eq "https://test.com/attachment" }
    end

    context "style" do
      let(:result) { subject.ar_core_stack_image(image_url: "https://test.com/preview", full_screen_image_url: "https://test.com/attachment", image_style: :profile) }

      it { expect(result[:type]).to eq :image }
      it { expect(result[:contentMode]).to eq "scaleAspectFill" }
      it { expect(result[:previewURL]).to eq "https://test.com/preview" }
      it { expect(result[:fullScreenImageURL]).to eq "https://test.com/attachment" }
      it { expect(result[:imageStyle]).to eq "profile" }
    end
  end

  describe "#ar_core_stack_unsplash_image" do
    let(:result) { subject.ar_core_stack_unsplash_image("https://unsplash.com/photos/100") }

    it { expect(result[:type]).to eq :image }
    it { expect(result[:previewURL]).to eq "https://source.unsplash.com/100/800x600" }
    it { expect(result[:fullScreenImageURL]).to eq "https://source.unsplash.com/100/800x600" }
  end

  describe "#ar_core_stack_video" do
    context "url" do
      let(:result) { subject.ar_core_stack_video(preview_url: "https://test.com/preview", attachment_url: "https://test.com/attachment") }

      it { expect(result[:type]).to eq :video }
      it { expect(result[:previewURL]).to eq "https://test.com/preview" }
      it { expect(result[:url]).to eq "https://test.com/attachment" }
    end
  end

  describe "#ar_core_stack_button" do
    let(:result) do
      subject.ar_core_stack_button(label: "Sign Up", style: :outline, on_success: :forward, sf_symbol_name: "Person",
                                   material_icon_name: "Person")
    end

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Sign Up" }
    it { expect(result[:style]).to eq :outline }
    it { expect(result[:onSuccess]).to eq :forward }
    it { expect(result[:sfSymbolName]).to eq "Person" }
    it { expect(result[:materialIconName]).to eq "Person" }
  end

  describe "#ar_core_stack_delete_button" do
    let(:result) { subject.ar_core_stack_delete_button(url: "https://test.com/delete", label: "Delete") }

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Delete" }
    it { expect(result[:style]).to eq :danger }
    it { expect(result[:onSuccess]).to eq :backward }
    it { expect(result[:sfSymbolName]).to eq :trash }
    it { expect(result[:materialIconName]).to eq :delete }
    it { expect(result[:url]).to eq "https://test.com/delete" }
    it { expect(result[:method]).to eq :delete }
  end

  describe "#ar_core_stack_url_button" do
    let(:result) { subject.ar_core_stack_url_button(url: "https://test.com/update", label: "Update", method: :put, style: :outline, confirm_title: "Confirm", confirm_text: "Are you sure?", on_success: :forward) }

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Update" }
    it { expect(result[:style]).to eq :outline }
    it { expect(result[:onSuccess]).to eq :forward }
    it { expect(result[:url]).to eq "https://test.com/update" }
    it { expect(result[:method]).to eq :put }
    it { expect(result[:confirmTitle]).to eq "Confirm" }
    it { expect(result[:confirmText]).to eq "Are you sure?" }
  end

  describe "#ar_core_stack_system_url_button" do
    let(:result) do
      subject.ar_core_stack_system_url_button(label: "Open Link", apple_system_url: "https://test.com/open",
                                              android_deep_link: "https://test.com/open", style: :primary, sf_symbol_name: "World", material_icon_name: "World")
    end

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Open Link" }
    it { expect(result[:style]).to eq :primary }
    it { expect(result[:appleSystemURL]).to eq "https://test.com/open" }
    it { expect(result[:androidDeepLink]).to eq "https://test.com/open" }
    it { expect(result[:sfSymbolName]).to eq "World" }
    it { expect(result[:materialIconName]).to eq "World" }
  end

  describe "#ar_core_stack_link_button" do
    let(:result) do
      subject.ar_core_stack_link_button(label: "Log In", link_id: "9e5ad548-dd58-4f9b-adbe-99c59049398", style: :primary,
                                        on_success: :none, sf_symbol_name: "Login", material_icon_name: "Login")
    end

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Log In" }
    it { expect(result[:linkId]).to eq "9e5ad548-dd58-4f9b-adbe-99c59049398" }
    it { expect(result[:style]).to eq :primary }
    it { expect(result[:onSuccess]).to eq :none }
    it { expect(result[:sfSymbolName]).to eq "Login" }
    it { expect(result[:materialIconName]).to eq "Login" }
  end

  describe "#ar_core_stack_modal_workflow_button" do
    let(:result) do
      subject.ar_core_stack_modal_workflow_button(label: "Log In", modal_workflow_name: "Log In", style: :primary,
                                                  on_success: :none, sf_symbol_name: "Login", material_icon_name: "Login")
    end

    it { expect(result[:type]).to eq :button }
    it { expect(result[:label]).to eq "Log In" }
    it { expect(result[:modalWorkflow]).to eq "Log In" }
    it { expect(result[:style]).to eq :primary }
    it { expect(result[:onSuccess]).to eq :none }
    it { expect(result[:sfSymbolName]).to eq "Login" }
    it { expect(result[:materialIconName]).to eq "Login" }
  end
end
