module Midl #:nodoc: all
  module Nodes
    module OptOut
      def meta_data_item
        { 'ignore_opt_out' => { Midl::ALL => true } }
      end
    end
  end
end
