# frozen_string_literal: true

module AppRail
  module Steps
    module BackgroundLocation
      module Regions
        def ar_background_location_region(id:, latitude:, longitude:, radius: 100, event: :entryAndExit)
          {
            id: id.to_s,
            latitude: latitude,
            longitude: longitude,
            radius: radius,
            event: event
          }
        end
      end
    end
  end
end
