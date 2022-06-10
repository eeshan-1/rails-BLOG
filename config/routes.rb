Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #BLOG
  # post request (CREATE)
  #post '/post/add', to:'post#postOne'
  post '/post/add' , to: 'post#addPost'
  post '/post/addMultiple', to:'post#postMultiple'
  
  # get request (READ)
  get '/post/:id', to: 'post#getPost'
  # get the user for the post
  get '/post/:id/user', to: 'post#getUserForPost'


  # put request (UPDATE)
  put '/post/:id', to: 'post#editPost'

  # delete request (DELETE)
  delete '/post/:id', to: 'post#deletePost'


  #USER
  # post request (CREATE)
  post '/user/add', to: 'user#postOne'
  post '/user/addMultiple', to:'user#postMultiple'

  # get request (READ)
  get '/user/:id', to: 'user#getUser'
  #get posts of user
  get '/user/:id/posts', to: 'user#getPostsOfUser'

 
  # delete request (DELETE)
  delete '/user/:id', to: 'user#deleteUser'
end
