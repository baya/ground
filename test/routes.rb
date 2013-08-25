SiteIndex = Class.new(Ground::State)
BooksIndex = Class.new(Ground::State)
BookShow = Class.new(Ground::State)
BookComments = Class.new(Ground::State)
UserNotes = Class.new(Ground::State)

Ground::Ridge(verb: 'get', path: '/', state: SiteIndex)
Ground::Ridge(verb: 'get', path: '/book/:id', state: BookShow)
Ground::Ridge(verb: 'get', path: '/books', state: BooksIndex)
Ground::Ridge(verb: 'post', path: '/book/:id/comments', state: BookComments)
Ground::Ridge(verb: 'get', path: '/:username/notes', state: UserNotes)


