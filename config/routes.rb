Rails.application.routes.draw do
  root 'board#index'
  
  get 'board/index'

  get '/new' => 'board#new'
  
  post '/save' => 'board#save'

  get '/simple' => 'board#simple'

  get '/detail/:id' => 'board#detail'
  
  get '/update_edit/:board_id' => 'board#update_edit'
  
  post '/update/:board_id' => 'board#update'
  
  get '/delete/:board_id' => 'board#delete'
  
  get 'join'=>'board#join'
  
  post '/join_write'=>'board#join_write'
  
  get 'board/join_list'
end
