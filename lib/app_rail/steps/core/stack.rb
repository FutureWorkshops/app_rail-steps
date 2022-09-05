# frozen_string_literal: true

module AppRail
  module Steps
    module Core
      module Stack
        CONTENT_MODE_OPTIONS = %i[scale_aspect_fill scale_aspect_fit].freeze
        IMAGE_STYLE_OPTIONS = %i[full_width profile].freeze
        BUTTON_STYLES = %i[primary outline danger].freeze
        ON_SUCCESS_OPTIONS = %i[none reload backward forward].freeze

        def ar_core_stack_text(text:, label: nil, sf_symbol_name: nil, material_icon_name: nil)
          {
            type: :text,
            label: label,
            text: text.to_s,
            sfSymbolName: sf_symbol_name,
            materialIconName: material_icon_name
          }.compact
        end

        def ar_core_stack_image(
          image_url:,
          full_screen_image_url: nil,
          image_style: :full_width,
          content_mode: :scale_aspect_fill
        )
          validate_content_mode!(content_mode)
          validate_image_style!(image_style)

          {
            type: :image,
            contentMode: camelcase_converter(content_mode.to_s, first_letter: :lower),
            previewURL: image_url,
            fullScreenImageURL: full_screen_image_url,
            fullScreenImageOnTap: !full_screen_image_url.nil?,
            imageStyle: camelcase_converter(image_style.to_s, first_letter: :lower)
          }
        end

        def ar_core_stack_unsplash_image(image_url)
          if image_url.start_with? "https://unsplash.com/photos"
            unsplash_id = image_url.split("/").last
            image_url = "https://source.unsplash.com/#{unsplash_id}/800x600"
          end
          ar_core_stack_image(image_url: image_url, full_screen_image_url: image_url)
        end

        def ar_core_stack_video(preview_url:, attachment_url:)
          { type: :video, previewURL: preview_url, url: attachment_url }
        end

        def ar_core_stack_button(label:, style: :primary, on_success: :forward, sf_symbol_name: nil, material_icon_name: nil)
          ar_core_stack_validate_on_success!(on_success)
          ar_core_stack_validate_button_style!(style)

          { type: :button, label: label, style: style, onSuccess: on_success, sfSymbolName: sf_symbol_name,
            materialIconName: material_icon_name }.compact
        end

        def ar_core_stack_delete_button(url:, label: "Delete", method: :delete, style: :danger, on_success: :backward, confirm_title: "Delete?", confirm_text: "Are you sure?", sf_symbol_name: :trash, material_icon_name: :delete)
          ar_core_stack_validate_on_success!(on_success)
          ar_core_stack_validate_button_style!(style)

          {
            type: :button,
            label: label,
            url: url,
            method: method,
            style: style,
            onSuccess: on_success,
            sfSymbolName: sf_symbol_name,
            materialIconName: material_icon_name,
            confirmTitle: confirm_title,
            confirmText: confirm_text
          }.compact
        end

        def ar_core_stack_url_button(url:, label:, method: :put, style: :primary, confirm_title: nil, confirm_text: nil, on_success: :reload, sf_symbol_name: nil, material_icon_name: nil)
          ar_core_stack_validate_on_success!(on_success)
          ar_core_stack_validate_button_style!(style)

          { type: :button, label: label, url: url, method: method, style: style, confirmTitle: confirm_title,
            confirmText: confirm_text, onSuccess: on_success, sfSymbolName: sf_symbol_name, materialIconName: material_icon_name }.compact
        end
        alias ar_core_stack_button_for_url ar_core_stack_url_button

        def ar_core_stack_system_url_button(label:, apple_system_url: nil, android_deep_link: nil, style: :primary, sf_symbol_name: nil, material_icon_name: nil)
          ar_core_stack_validate_button_style!(style)
          raise "Invalid android_deep_link" if android_deep_link && !android_deep_link.start_with?("http")

          { type: :button, label: label, appleSystemURL: apple_system_url, androidDeepLink: android_deep_link,
            style: style, sfSymbolName: sf_symbol_name, materialIconName: material_icon_name }.compact
        end
        alias ar_core_stack_button_for_system_url ar_core_stack_system_url_button

        def ar_core_stack_link_button(label:, link_id:, style: :primary, on_success: :none, sf_symbol_name: nil, material_icon_name: nil)
          ar_core_stack_validate_on_success!(on_success)
          ar_core_stack_validate_button_style!(style)

          { type: :button, label: label, linkId: link_id, style: style, onSuccess: on_success,
            sfSymbolName: sf_symbol_name, materialIconName: material_icon_name }.compact
        end

        # Remove this method once V1 is no longer being used
        def ar_core_stack_modal_workflow_button(label:, modal_workflow_name:, style: :primary, on_success: :none, sf_symbol_name: nil, material_icon_name: nil)
          ar_core_stack_validate_on_success!(on_success)
          ar_core_stack_validate_button_style!(style)

          { type: :button, label: label, modalWorkflow: modal_workflow_name, style: style, onSuccess: on_success,
            sfSymbolName: sf_symbol_name, materialIconName: material_icon_name }.compact
        end
        alias ar_core_stack_button_for_modal_workflow ar_core_stack_modal_workflow_button

        private

        def validate_content_mode!(content_mode)
          raise "Unknown content_mode" unless CONTENT_MODE_OPTIONS.include?(content_mode)
        end

        def validate_image_style!(image_style)
          raise "Unknown image_style" unless IMAGE_STYLE_OPTIONS.include?(image_style)
        end

        def ar_core_stack_validate_on_success!(on_success)
          raise "Unknown on_success action" unless ON_SUCCESS_OPTIONS.include?(on_success)
        end

        def ar_core_stack_validate_button_style!(style)
          raise "Unknown style" unless BUTTON_STYLES.include?(style)
        end
      end
    end
  end
end
