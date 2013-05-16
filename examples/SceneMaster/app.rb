# -*- coding: utf-8 -*-
libdir = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/../lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'ground'
require 'rack'
require 'haml'
require 'tilt'
require 'scene/index'
require 'aui/css'


SenceMaster = Ground::CreateApp(name: '场景大师')

Ground::StartApp app: SenceMaster, port: 9393 do
  use Rack::ShowExceptions
  use Rack::CommonLogger
  use Rack::Lint
end
