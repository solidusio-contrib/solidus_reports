# frozen_string_literal: true

require 'cancan'
require 'cancan/matchers'

class DummyAbility
  include CanCan::Ability
end
