# frozen_string_literal: true

require 'midl/constants'
require 'midl/parser'
require 'midl/version'

# Midl namespacing definition
module Midl
  def self.root
    ::File.expand_path('..', __dir__)
  end

  class Error < StandardError; end
end
