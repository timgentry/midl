module Midl #:nodoc: all
  module Nodes
    module OptOut
      def meta_data_item
        { 'ignore_opt_out' => true }
      end
    end
  end
end
