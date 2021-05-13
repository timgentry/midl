module Midl #:nodoc: all
  module Nodes
    module Main
      def meta_data_item
        { 'table' => { Midl::EQUALS => table_name.text_value.downcase } }
      end
    end
  end
end
