# frozen_string_literal: true

require 'midl/version'
require 'midl/parser'

# Midl namespacing definition
module Midl
  def self.root
    ::File.expand_path('..', __dir__)
  end

  class Error < StandardError; end
end
