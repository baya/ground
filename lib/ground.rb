require 'dun'
require 'rack'
require 'logger'
require 'ground/activity'
require 'ground/mime_type'
require 'ground/protocol/render'
require 'ground/protocol/render/template'
require 'ground/activity/ridge'
require 'ground/protocol/verb'
require 'ground/protocol/helper'
require 'ground/activity/log'
require 'ground/activity/locate'
require 'ground/activity/state'
require 'ground/activity/validate'
require 'ground/rack/url_suffix'
require 'ground/rack/base_rack'
require 'ground/activity/hash_with_double_access'
require 'ground/activity/create_application'


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

Ground do
  set :logger, ::Logger.new(STDOUT)
end

