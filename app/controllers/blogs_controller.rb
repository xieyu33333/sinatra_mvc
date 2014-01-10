get '/' do
  @blogs = Blog.all
  erb :index
end

get '/new' do
  "new"
end