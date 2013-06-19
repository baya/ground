require 'dun'
require 'ground/activity'
require 'ground/protocol/render'
require 'ground/ridge'
require 'ground/protocol/verb'
require 'ground/locate'
require 'ground/state'
require 'ground/validate'
require 'ground/hash_with_double_access'
require 'ground/config'
require 'ground/create_app'
require 'ground/start_app'

if not Kernel.method_defined?('Ground')
  Kernel.class_eval do
    def Ground(&p)
      Ground.instance_eval &p
    end
  end
end

Ground.extend Ground::Protocol::Verb

