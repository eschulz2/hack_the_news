enable :sessions


get '/' do
  @posts =Post.all

  erb :index
end

get '/user/:id' do
  @user =User.find(params[:id])

  erb :user
end

get '/post/:id/comments' do
   @comments =Post.find(params[:id]).comments
  erb :comments
end  

get '/user/:id/comments' do
  @user =User.find(params[:id])
  @comments= @user.comments
  erb :user_comments
end

get '/submit' do
  erb :submit
end


post '/login' do 

    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect "/"
    else
      redirect "/"
    end

end


post '/submit' do
  post = Post.create(params[:post])
  post.user = User.find(session[:id])
  post.save

  redirect ("/post/#{post.id}/comments")

end
