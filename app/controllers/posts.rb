get '/posts' do
  @posts = Post.all
  @posts.each do |post|
    p post.title
  end
  erb :posts
end

get '/posts/new' do
  erb :new_post
end

post '/posts/new' do
  Post.create :title => params[:title],
              :url => params[:url]
  redirect '/posts'
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments
  erb :post
end

post '/upvote/post' do
  content_type :json
  post = Post.find(params[:id])
  user_id = current_user.id
  Postvote.create :post_id => post.id,
                  :user_id => user_id
  { :postvotes => post.postvotes.length }.to_json
end 

post '/upvote/comment' do
  content_type :json
  comment = Comment.find(params[:id])
  user_id = current_user.id
  Commentvote.create :comment_id => comment.id,
                     :user_id    => user_id
  { :commentvotes => comment.commentvotes.length }.to_json
end
