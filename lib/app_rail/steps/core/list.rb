# frozen_string_literal: true

module AppRail
  module Steps
    module Core
      module List
        def ar_core_list_item(text:, id: self.id, detail_text: nil, section_name: nil, sf_symbol_name: nil, material_icon_name: nil, preview_url: nil, type: nil)
          {
            id: id,
            text: text.to_s,
            detailText: detail_text.to_s,
            sectionName: section_name.to_s,
            sfSymbolName: sf_symbol_name,
            materialIconName: material_icon_name,
            imageURL: preview_url,
            type: type
          }.compact
        end

        def ar_core_list_search_suggestion(text:, section_name:, id: self.id, sf_symbol_name: nil)
          { id: id.to_s, text: text, sectionName: section_name, sfSymbolName: sf_symbol_name }.compact
        end
      end
    end
  end
end
