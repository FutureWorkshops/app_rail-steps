# frozen_string_literal: true

require_relative "core/list"
require_relative "core/stack"
require_relative "core_forms/form"
require_relative "core_forms/question"
require_relative "maps/map"
require_relative "grid/grid"
require_relative "charts/dashboard"
require_relative "background_location/region"

module AppRail
  module Steps
    module Displayable
      include Steps::Core::List
      include Steps::Core::Stack
      include Steps::CoreForms::Form
      include Steps::CoreForms::Question
      include Steps::Maps::Map
      include Steps::Grid::Grid
      include Steps::Charts::Dashboard
      include Steps::BackgroundLocation::Region

      def camelcase_converter(string, first_letter: :upper)
        string = string.split("_").map(&:capitalize).join
        return string unless first_letter == :lower

        string[0].downcase + string[1..]
      end
    end
  end
end
