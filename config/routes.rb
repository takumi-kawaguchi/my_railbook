Rails.application.routes.draw do
  resources :members
  resources :fan_comments
  resources :authors
  resources :users
  resources :books do
    resources :reviews, shallow: true
  end
  namespace :admin do
    resources :books
  end
  get 'hello/view'
  get 'hello/list'

  get 'view/form_tag'
  post 'view/create'
  get 'view/form_for'
  get 'view/field'
  get 'view/html5'
  get 'view/select'
  get 'view/col_select'
  get 'view/group_select'
  get 'view/col_radio'
  get 'view/fields'
  get 'view/simple_format'
  get 'record/page(/:id)' => 'record#page'

  get 'ctrl/index' => 'ctrl#index'
  get 'ctrl/para(/:id)' => 'ctrl#para'
  get 'ctrl/para_array' => 'ctrl#para_array'
  get 'ctrl/req_headers' => 'ctrl#req_headers'
  get 'ctrl/upload' => 'ctrl#upload'
  post 'ctrl/upload_process' => 'ctrl#upload_process'
  get 'ctrl/updb(/:id)' => 'ctrl#updb'
  patch 'ctrl/updb_process(/:id)' => 'ctrl#updb_process'
  get 'ctrl/cmd_response' => 'ctrl#cmd_response'
  get 'ctrl/get_xml' => 'ctrl#get_xml'
  get 'ctrl/get_json' => 'ctrl#get_json'
  get 'ctrl/cookie' => 'ctrl#cookie'
  post 'ctrl/cookie_rec' => 'ctrl#cookie_rec'
  get 'ctrl/session_show' => 'ctrl#session_show'
  post 'ctrl/session_rec' => 'ctrl#session_rec'
  get 'ctrl/device' => 'ctrl#device'

  get 'login/index' => 'login#index'
  post 'login/auth' => 'login#auth'

  match 'detail(/:id)' => 'hello#index', via: [:get, :post]
  root to: 'books#index'
end
