# frozen_string_literal: true

module AppRail
  module Steps
    module Maps
      module Map
        def ar_maps_map_item(text:, latitude:, longitude:, id: self.id, detail_text: nil)
          { id: id.to_s, text: text, latitude: latitude.to_f, longitude: longitude.to_f,
            detailText: detail_text }.compact
        end
      end
    end
  end
end
