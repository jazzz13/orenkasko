Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '' => 'application#home_page'

  post 'applications' => 'application#create'

  post 'upload_image' => 'application#upload_image'

end
