enable :sessions


get '/' do
  @posts =Post.all

  erb :index
end

get '/user/:id' do
  @user =User.find(params[:id])

  erb :user
end

get '/post/:post_id/vote' do

  if session[:id]
    begin
      new_vote = PostVote.new
      new_vote.user_id = session[:id]
      new_vote.post_id = params[:post_id]
      new_vote.save
    rescue
      puts "That user has already voted on that post!"
    end
  end

  if request.xhr?
    content_type :json
    { vote_count: Post.find(params[:post_id]).post_votes.count, post_id: params[:post_id] }.to_json
  else
    redirect '/'
  end
end


get '/post/:id/comments' do
   @post=Post.find(params[:id])
   @comments =@post.comments
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

get '/comments' do
  @comments = Comment.all.order("created_at desc").limit(10)
  erb :all_comments
end

get '/signup' do
  if session[:id]
    redirect ("/user/#{session[:id]}")
  end
  erb :signup
end  

get '/logout' do
  session.clear
  redirect '/'
end


#=============================================


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

post '/comment' do
  comment=Comment.new(params[:comment])
  comment.user_id = session[:id]
  comment.save
  redirect "/post/#{params[:comment][:post_id]}/comments"

end

post '/signup' do

    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    @user.save!
    session[:id] = @user.id

    redirect "/user/#{@user.id}"
end



