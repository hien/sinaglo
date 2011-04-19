# Sinaglo - A Sinatra-based Blog backed by MongoDB

Everything you need and nothing you don't.

This started out as a project to learn more about Sinatra and turned
out to be a useful project to replace WordPress.  No, it does not do
what WordPress does, but it does everything I needed it to do.

If anything, this should be a good starting point for a Sinatra based
application.

## Requirements

You need to have MongoDB running.  Right now it assumes it's running on
localhost with the database name: `blog`.  Feel free to modify as needed
in the `service.rb` file.

## Installation

Install the required gems:

    $ gem install sinatra haml mongoid maruku

Optionally, install bson_ext for better performance to MongoDB:

    $ gem install bson_ext

## Starting

From the command line:

    $ ruby -rubygems service.rb

With Rack:

    $ thin start -R config.ru

## Administration

The administration links appear once you are authenticated.
Authentication is handled via BASIC_AUTH.  The username and password are
configurable.  To login, go to one of the pages that require
authentication: http://localhost:4567/posts/new

## Deployment

Since this is a rack application, it can be deployed in the typical
methods.  I happen to favor Apache + Passenger, but there are many other
options.

# References

* http://www.sinatrarb.com/
* http://haml-lang.com/
* http://www.mongodb.org/
* http://mongoid.org/
* http://maruku.rubyforge.org/maruku.html

# Contact Information

You can find me on Twitter: @dshimy or via gmail.

# License

MIT License

Copyright (c) 2011 Darian Shimy

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

