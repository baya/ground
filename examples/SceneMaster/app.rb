# -*- coding: utf-8 -*-
libdir = File.expand_path(File.dirname(File.dirname(__FILE__)) + '/../lib')
$LOAD_PATH.unshift libdir unless $LOAD_PATH.include?(libdir)

activity_dir = File.expand_path(File.join(File.dirname(__FILE__), 'activities'))
$LOAD_PATH.unshift activity_dir unless $LOAD_PATH.include?(activity_dir)

require 'ground'
require 'rack'
require 'haml'
require 'tilt'
require 'sequel'
require 'scene/index'
require 'scene/new'
require 'scene/create'
require 'create_scene'

DB = Sequel.connect('postgres://pgsql:@localhost/SceneMaster_development')

SenceMaster = Ground::CreateApp(name: '场景大师')

Ground::StartApp app: SenceMaster, port: 9393 do
  use Rack::ShowExceptions
  use Rack::CommonLogger
end
