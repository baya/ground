require 'dun'
require 'rack'
require 'ground/activity'
require 'ground/protocol/render'
require 'ground/protocol/render/template'
require 'ground/ridge'
require 'ground/protocol/verb'
require 'ground/protocol/helper'
require 'ground/locate'
require 'ground/state'
require 'ground/validate'
require 'ground/hash_with_double_access'
require 'ground/config'
require 'ground/create_app'

if not Kernel.method_defined?('Ground')
  Kernel.class_eval do
    def Ground(&p)
      Ground.instance_eval &p
    end
  end
end

module Ground
  extend Protocol::Verb
  extend Protocol::Helper

  class << self
    
    MetaG = self
    
    def set(attr, value)
      MetaG.class_eval { attr_reader attr }
      instance_variable_set "@#{attr}", value
    end
    
  end
  
end


