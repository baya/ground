module Ground
  MimeType = {
    "*/*"                      => :all,
    "text/plain"               => :text,
    "text/html"                => :html,
    "application/xhtml+xml"    => :html,
    "text/javascript"          => :js, 
    "application/javascript"   => :js, 
    "application/x-javascript" => :js, 
    "text/calendar"            => :ics,   
    "text/csv"                 => :csv,   
    "application/xml"          => :xml,
    "text/xml"                 => :xml, 
    "application/x-xml"        => :xml, 
    "text/yaml"                => :yaml, 
    "application/x-yaml"       => :yaml, 
    "application/rss+xml"      => :rss,   
    "application/atom+xml"     => :atom,  
    "application/json"         => :json, 
    "text/x-json"              => :json
  }
end
