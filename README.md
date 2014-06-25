[![Gem Version](https://badge.fury.io/rb/ground.svg)](http://badge.fury.io/rb/ground)

# Ground
Ground is a web framework, no controller, no model, no views and no mvc. Most of the ground codes are inherited from
[Dun::Activity](https://github.com/baya/dun/blob/master/lib/dun.rb). So ground is a high unified web framework.

## install

`gem install ground`

or in Gemfile:

`gem 'ground'`

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

    class Create < State
	  def call
	    @book = Book.create(params[:book])
		rediret '/books'
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
	post '/book', Book::Create
  end
```

## route helpers

```ruby
  SiteIndex.path     # '/'
  Book::Index.path   # '/books'
  Book::Show.path(2) # '/book/2'
  Book::Create.path  # '/book'
```

## sets

```ruby
  Ground do
    set :env, (ENV['RACK_ENV'] || 'development').to_s
	set :logger, ::Logger.new(STDOUT)
  en

  Ground.env #=> development
  Ground.logger.info("debug+++")
```

## helpers

```ruby
  # Book::Index, Book::Show will hava instance method 'hello_ground'
  Ground do
    help Book::Index, Book::Show do

	  def hello_ground
	    'hello ground'
	  end

	end
  end
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

## Apps using ground

* [SceneMaster](https://github.com/baya/SceneMaster)
* [Description](https://github.com/baya/description)
* [Gstar](https://github.com/baya/Gstar)


