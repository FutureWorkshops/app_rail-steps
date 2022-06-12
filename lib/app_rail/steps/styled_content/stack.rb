# frozen_string_literal: true

module AppRail
  module Steps
    module StyledContent
      module Stack
        BUTTON_STYLES = %i[primary outline danger textOnly].freeze
        ON_SUCCESS_OPTIONS = %i[none reload backward forward].freeze

        def ar_styled_content_stack_title(title:)
          raise "Missing title" if title.nil?

          { id: id, title: title, type: :title }
        end

        def ar_styled_content_stack_text(text:)
          raise "Missing text" if text.nil?

          { text: text, type: :text }
        end

        def ar_styled_content_stack_list_item(text:, detail_text: nil, preview_url: nil)
          raise "Missing text" if text.nil?

          { text: text, detailText: detail_text, type: :listItem, imageURL: preview_url }.compact
        end

        # Remove `modal_workflow_name` argument once V1 is no longer being used
        def ar_styled_content_stack_button(label:, url: nil, method: :nil, on_success: :none, style: :primary, modal_workflow_name: nil, link_id: nil, link_url: nil, sf_symbol_name: nil, apple_system_url: nil, android_deep_link: nil, confirm_title: nil, confirm_text: nil, share_text: nil, share_image_url: nil)
          raise "Missing label" if label.nil?

          ar_styled_content_stack_validate_on_success!(on_success)
          ar_styled_content_stack_validate_button_style!(style)

          { type: :button, label: label, url: url, method: method, onSuccess: on_success, style: style,
            modalWorkflow: modal_workflow_name, linkId: link_id, linkURL: link_url, sfSymbolName: sf_symbol_name, appleSystemURL: apple_system_url, androidDeepLink: android_deep_link, confirmTitle: confirm_title, confirmText: confirm_text, shareText: share_text, shareImageURL: share_image_url }.compact
        end

        private

        def ar_styled_content_stack_validate_on_success!(on_success)
          raise "Unknown on_success action" unless ON_SUCCESS_OPTIONS.include?(on_success)
        end

        def ar_styled_content_stack_validate_button_style!(style)
          raise "Unknown style" unless BUTTON_STYLES.include?(style)
        end
      end
    end
  end
end
