# frozen_string_literal: true

RSpec.describe AppRail::Steps::CoreForms::Question do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }
  describe "#ar_core_forms_form_multiple_selection" do
    let(:multiple_section_options) do
      [{ text: "Alcohol Free", isPreSelected: true }, { text: "Sunrise Yoga", isPreSelected: false }]
    end
    let(:result) do
      subject.ar_core_forms_question_multiple_selection(label: "Challenge Type",
                                                        multiple_selection_options: multiple_section_options,
                                                        selection_type: :single,
                                                        optional: false)
    end

    it { expect(result[:item_type]).to eq :multiple_selection }
    it { expect(result[:label]).to eq "Challenge Type" }
    it { expect(result[:multiple_selection_options]).to eq multiple_section_options }
    it { expect(result[:selection_type]).to eq :single }
    it { expect(result[:optional]).to eq false }
    it { expect(result[:show_other_option]).to eq false }
  end
end
