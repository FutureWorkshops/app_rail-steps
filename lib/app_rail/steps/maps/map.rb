# frozen_string_literal: true

module AppRail
  module Steps
    module Maps
      module Map
        def ar_maps_map_item(text:, latitude:, longitude:, id: self.id, detail_text: nil)
          { id: id, text: text, latitude: latitude, longitude: longitude, detailText: detail_text }.compact
        end
      end
    end
  end
end
