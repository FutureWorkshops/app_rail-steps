# frozen_string_literal: true

module AppRail
  module Steps
    module Grid
      module Grid
        def ar_styled_content_grid_large_section(id:, text:)
          raise "Missing id" if id.nil?
          raise "Missing text" if text.nil?

          { id: id, text: text, type: :largeSection }
        end

        def ar_styled_content_grid_small_section(id:, text:)
          raise "Missing id" if id.nil?
          raise "Missing text" if text.nil?

          { id: id, text: text, type: :smallSection }
        end

        def ar_styled_content_grid_item(text:, id: self.id, detail_text: nil, preview_url: nil)
          raise "Missing id" if id.nil?
          raise "Missing text" if text.nil?

          { id: id, text: text, type: :item, detailText: detail_text, imageURL: preview_url }.compact
        end
      end
    end
  end
end
