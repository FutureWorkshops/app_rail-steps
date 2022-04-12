require 'spec_helper'

RSpec.describe AppRail::Steps::Core::List do
  let(:test_class) { Struct.new(:id) { include AppRail::Steps::Displayable } }
  let(:id) { 1 }

  subject { test_class.new(id) }

  include_examples 'list'
end
