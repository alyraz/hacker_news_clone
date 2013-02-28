post '/signup' do
  @user = User.find_by_email(params[:email])
  if @user
    #TODO - display errors
    redirect('/')
  else
    @user = User.create(:email => params[:email], :password => params[:password]) 
    session[:user_id] = @user.id
    redirect('/posts')
  end
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user.authenticate(params[:password]) 
    session[:user_id] = @user.id
    redirect('/posts')
  else 
    #TODO - display errors
    redirect('/')
  end 
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  @comments = @user.comments 
  erb :user
end 

get '/logout' do
  session.clear
  redirect '/'
end

get '/login' do
  redirect '/'
end
