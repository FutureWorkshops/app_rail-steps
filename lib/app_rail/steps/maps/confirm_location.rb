# frozen_string_literal: true

module AppRail
  module Steps
    module Maps
      module ConfirmLocation
        def ar_maps_confirm_location(latitude:, longitude:, text:, detail_text: nil)
          {
            text: text,
            latitude: latitude.to_f,
            longitude: longitude.to_f,
            detailText: detail_text
          }.compact
        end
      end
    end
  end
end
