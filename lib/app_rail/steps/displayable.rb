require_relative "core/list"
require_relative "maps/map"

module AppRail
  module Steps
    module Displayable

      include Steps::Core::List
      include Steps::Maps::Map

      BUTTON_STYLES = [:primary, :outline, :danger, :textOnly]
      ON_SUCCESS_OPTIONS = [:none, :reload, :backward, :forward]
    
      private
      def validate_on_success!(on_success)
        raise 'Unknown on_success action' unless ON_SUCCESS_OPTIONS.include?(on_success)
      end
    
      def validate_button_style!(style)
        raise 'Unknown style' unless BUTTON_STYLES.include?(style)      
      end

      def camelcase_converter(string, first_letter: :upper)
        string = string.split("_").map(&:capitalize).join
        return string unless first_letter == :lower

        string[0].downcase + string[1..-1]
      end
    end
  end
end