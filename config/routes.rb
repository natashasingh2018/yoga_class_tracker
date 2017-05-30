Rails.application.routes.draw do

  devise_for :users
  root 'classsessions#index'

  # Routes for the Studio resource:

  # CREATE
  get "/studios/new", :controller => "studios", :action => "new"
  post "/create_studio", :controller => "studios", :action => "create"

  # READ
  get "/studios", :controller => "studios", :action => "index"
  get "/studios/:id", :controller => "studios", :action => "show"

  # UPDATE
  get "/studios/:id/edit", :controller => "studios", :action => "edit"
  post "/update_studio/:id", :controller => "studios", :action => "update"

  # DELETE
  get "/delete_studio/:id", :controller => "studios", :action => "destroy"
  #------------------------------

  # Routes for the Format resource:
  # CREATE
  get "/formats/new", :controller => "formats", :action => "new"
  post "/create_format", :controller => "formats", :action => "create"

  # READ
  get "/formats", :controller => "formats", :action => "index"
  get "/formats/:id", :controller => "formats", :action => "show"

  # UPDATE
  get "/formats/:id/edit", :controller => "formats", :action => "edit"
  post "/update_format/:id", :controller => "formats", :action => "update"

  # DELETE
  get "/delete_format/:id", :controller => "formats", :action => "destroy"
  #------------------------------

  # Routes for the Classsession resource:
  # CREATE
  get "/classsessions/new", :controller => "classsessions", :action => "new"
  post "/create_classsession", :controller => "classsessions", :action => "create"

  # READ
  get "/classsessions", :controller => "classsessions", :action => "index"
  get "/classsessions/:id", :controller => "classsessions", :action => "show"

  # UPDATE
  get "/classsessions/:id/edit", :controller => "classsessions", :action => "edit"
  post "/update_classsession/:id", :controller => "classsessions", :action => "update"

  # DELETE
  get "/delete_classsession/:id", :controller => "classsessions", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
