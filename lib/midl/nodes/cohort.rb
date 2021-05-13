module Midl #:nodoc: all
  module Nodes
    module Cohort
      def meta_data_item
        { 'cohort' => { Midl::EQUALS => text_value.upcase.sub('_', '-'), position: interval } }
      end
    end
  end
end
