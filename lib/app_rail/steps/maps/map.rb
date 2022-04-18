module AppRail
  module Steps
    module Maps
      module Map
        def ar_maps_map_item(id: self.id, text:, latitude:, longitude:, detail_text: nil)
          { id: id, text: text, latitude: latitude, longitude: longitude, detailText: detail_text }.compact
        end
      end
    end
  end
end