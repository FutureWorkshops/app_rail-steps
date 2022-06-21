# frozen_string_literal: true

require_relative "core/list"
require_relative "core/stack"
require_relative "core_forms/form"
require_relative "core_forms/question"
require_relative "maps/map"
require_relative "styled_content/grid"
require_relative "styled_content/stack"
require_relative "charts/dashboard"

module AppRail
  module Steps
    module Displayable
      include Steps::Core::List
      include Steps::Core::Stack
      include Steps::CoreForms::Form
      include Steps::CoreForms::Question
      include Steps::Maps::Map
      include Steps::StyledContent::Grid
      include Steps::StyledContent::Stack
      include Steps::Charts::Dashboard

      def camelcase_converter(string, first_letter: :upper)
        string = string.split("_").map(&:capitalize).join
        return string unless first_letter == :lower

        string[0].downcase + string[1..]
      end
    end
  end
end
