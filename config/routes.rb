Rails.application.routes.draw do

# the pictures#index is the method (index) for the controller (pictures).

  root 'pictures#index'

# to go to "pictures"

  get   'pictures' => 'pictures#index'  #the controller

# to show new pictures

get   'pictures/show' => 'pictures#show_new_pics'  #the controller

# to show most popular pictures

get   'pictures/popular' => 'pictures#show_popular_pics'  #the controller

get   'pictures/created' => 'pictures#pictures_created_in_year'  #the controller


# to create a picture

  post  'pictures' => 'pictures#create'
  get   'pictures/new' => 'pictures#new'


  # and to reference a specific: "pictures/1" or pictures/2...

    get   'pictures/:id' => 'pictures#show'

# to edit the picture

  get   'pictures/:id/edit' => "pictures#edit"
  patch 'pictures/:id' => "pictures#update"

# to delete the picture

  delete 'pictures/:id' => 'pictures#destroy'

end
