# Ground
Ground is a web framework, no controller, no model, no views and no mvc. Most of the ground codes are inherited from
[Dun::Activity](https://github.com/baya/dun/blob/master/lib/dun.rb). So ground is a high unified web framework.

## states

```ruby
  class SiteIndex < Ground::State
    def call
	  text 'Site Index'
	end
  end

  module Book
    State = Ground::State
	
    class Index < State
	  def call
	    @books = Book.all
		html erb('views/book/index.html.erb')
	  end
	end

    class Show < State
	  def call
	    @book = Book.find(params[:id])
		html erb('views/book/show.html.erb')
	  end
	end
	
  end
```

## routes

```ruby
  Ground do
    get '/', SiteIndex
	get '/books', Book::Index
	get '/book/:id', Book::Show
  end
```

## sets

```ruby
  Ground do
    set :env, (ENV['RACK_ENV'] || 'development').to_s
	set :logger, ::Logger.new(STDOUT)
  en

  Ground.env #=> devlopment
  Ground.logger.info("debug+++")
```

## create a ground app

```ruby
  module BookStore
	App = Ground 'book store' do
	  use Rack::ShowExceptions
	  use Rack::Static, urls: ['/js', '/css', '/lib', '/partials'], :root => "lib/app"
	  ...
	end
  end
```

## config.ru

``` ruby
  $: << '.'
  require 'app'
  run BookStore::App
```




