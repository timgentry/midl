# frozen_string_literal: true

require 'midl/version'
require 'midl/parser'

module Midl
  def self.root
    ::File.expand_path('..', __dir__)
  end

  class Error < StandardError; end
  # Your code goes here...
end
