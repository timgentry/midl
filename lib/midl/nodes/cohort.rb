module Midl #:nodoc: all
  module Nodes
    module Cohort
      def meta_data_item
        { 'cohort' => { Midl::EQUALS => nic_code.text_value.upcase.sub('_', '-') } }
      end
    end
  end
end
