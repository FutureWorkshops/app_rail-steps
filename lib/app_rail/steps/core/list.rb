module AppRail
  module Steps
    module Core
      module List
        def ar_core_list_item(id: self.id, text:, detail_text: nil, sf_symbol_name: nil, material_icon_name: nil, preview_url: nil)
          { id: id, text: text, detailText: detail_text, sfSymbolName: sf_symbol_name, materialIconName: material_icon_name, imageURL: preview_url }.compact
        end
        
        def ar_core_list_search_suggestion(id: self.id, text:, section_name:, sf_symbol_name: nil)
          {id: id.to_s, text: text, sectionName: section_name, sfSymbolName: sf_symbol_name}.compact
        end
      end
    end
  end
end