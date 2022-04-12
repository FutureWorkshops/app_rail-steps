require 'spec_helper'

# This file tests the module without using Rails
RSpec.describe AppRail::Steps::Displayable do
  let(:test_struct) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:test_class) { Class.new { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_struct.new(id) }

  include_examples 'list', { active_storage_enabled: false }
end
