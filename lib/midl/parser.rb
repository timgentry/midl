require 'midl/nodes'
require 'midl/grammars'

module Midl
  # This class simplifies MiDL queries by wrapping them in a little syntactic sugar.
  class Parser
    attr_reader :parser

    DEFAULT_META_DATA = {
      'ignore_opt_out' => { Midl::ALL => false }
    }.freeze

    def initialize(query)
      raise ArgumentError unless query.is_a?(String)

      @parser = MidlParser.new
      @result = @parser.parse(query.downcase)

      return if valid?
      # FIXME: should log "Parser failed parsing \"#{query}\": #{@parser.failure_reason} " \
      #                   "(line: #{@parser.failure_line}, column: #{@parser.failure_column})"
    end

    def valid?
      !@result.nil?
    end

    def failure_reason
      valid? ? nil : @parser.failure_reason
    end

    def failure_line
      valid? ? nil : @parser.failure_line
    end

    def failure_column
      valid? ? nil : @parser.failure_column
    end

    # check if any query conditions been ignored or modified
    def messages
      msg = ''.html_safe
      meta_data.each do |_canonical_name, filter|
        msg += filter[Midl::MESSAGE] if filter.key?(Midl::MESSAGE)
      end
      msg
    end

    def meta_data
      valid? ? @result.meta_data(DEFAULT_META_DATA.dup) : {}
    end
  end
end
