# frozen_string_literal: true

require "spec_helper"

# This file tests the module without using Rails
RSpec.describe AppRail::Steps::Displayable do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }

  include_examples "core_list"
  include_examples "core_stack"
  include_examples "core_forms_form"
  include_examples "maps_map"
  include_examples "styled_content_grid"
  include_examples "styled_content_stack"
end
