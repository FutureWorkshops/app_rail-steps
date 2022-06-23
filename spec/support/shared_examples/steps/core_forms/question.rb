# frozen_string_literal: true

shared_examples_for "core_forms_question" do
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
