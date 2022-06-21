# frozen_string_literal: true

module AppRail
  module Steps
    module CoreForms
      module Question
        def ar_core_forms_question_multiple_selection(id:, label:, multiple_selection_options:, selection_type: :single, optional: false, show_other_option: false)
          raise "Missing label" if label.nil?
          raise "Missing id" if id.nil?
          raise "Missing multiple_selection_options" if multiple_selection_options.nil?

          {
            item_type: :multiple_selection,
            id: id,
            label: label,
            multiple_selection_options: multiple_selection_options,
            selection_type: selection_type,
            optional: optional,
            show_other_option: show_other_option
          }
        end
      end
    end
  end
end
