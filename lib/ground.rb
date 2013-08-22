require 'dun'
require 'rack'
require 'ground/activity'
require 'ground/protocol/render'
require 'ground/protocol/render/template'
require 'ground/ridge'
require 'ground/protocol/verb'
require 'ground/protocol/helper'
require 'ground/log'
require 'ground/locate'
require 'ground/state'
require 'ground/validate'
require 'ground/base_rack'
require 'ground/hash_with_double_access'
require 'ground/create_application'


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

if not Kernel.method_defined?('Ground')
  Kernel.class_eval do
    def Ground(app_name = nil, &p)
      if app_name
        Ground::CreateApplication(name: app_name, &p)
      else
        Ground.instance_eval &p
      end
    end
  end
end



