%w{sinatra/base erb maruku mongoid cgi}.each { |lib| require lib }

MONGO_DB    = 'sinaglo'
A_USER      = 'admin'
A_PASS      = 'admin'
SITE_AUTHOR = 'Darian Shimy'
SITE_DOMAIN = 'www.darianshimy.com'
SITE_NAME   = 'Darian Shimy'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db(MONGO_DB)
end

class Post
  include Mongoid::Document
  identity :type => String
  field :title
  field :body
  field :published_at, :type => DateTime

  def to_html
    Maruku.new(body).to_html
  end

  def url
    "/posts/#{id}"
  end
end

class BlogApplication < Sinatra::Base

  set :app_file, __FILE__
  set :static, true
  set :public_folder, 'public'
  set :sessions, true

  helpers do
    def protected!
      if authorized?
        session[:admin] = true
      else
        response['WWW-Authenticate'] = %(Basic realm="Restricted Area")
        throw(:halt, [401, "Not authorized\n"])
      end
    end
    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [A_USER, A_PASS]
    end
  end

  get "/" do
    @posts = Post.order_by([:published_at, :desc]).limit(10)
    erb :index, :ugly => true
  end

  get "/archive" do
    @posts = Post.order_by([:published_at, :desc])
    erb :archive
  end

  get '/posts.atom' do
    @posts = Post.order_by([:published_at, :desc]).limit(10)
    content_type 'application/atom+xml', :charset => 'utf-8'
    builder :feed
  end

  post '/posts' do
    protected!
    post = Post.create :title => params[:title], :_id => params[:_id], :body => params[:body], :published_at => Time.now
    redirect post.url
  end

  get '/posts/new' do
    protected!
    post = Post.new
    post.id = ""
    erb :edit, :locals => { :post => post, :url => '/posts' }
  end

  get "/posts/:key" do
    @post = Post.find(params[:key])
    erb :show, :ugly => true
  end

  get '/posts/:key/edit' do
    protected!
    post = Post.find(params[:key])
    erb :edit, :locals => { :post => post, :url => post.url }
  end

  post '/posts/:key' do
    protected!
    post = Post.find(params[:key])
    post.title = params[:title]
    post.body = params[:body]
    post.save
    redirect post.url
  end

  run! if app_file == $0

end
