require 'treetop'

Treetop.load File.expand_path('grammars/opt_out', File.dirname(__FILE__))
Treetop.load File.expand_path('grammars/main', File.dirname(__FILE__))
