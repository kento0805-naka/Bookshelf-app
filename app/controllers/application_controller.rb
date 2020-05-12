class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!, except: [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def after_sign_in_path_for(resource)
    @user
  end
  
  def counts(user)
    @count_followings = user.followings.count 
    @count_followers = user.followers.count
  end
  
  def read(result)
    title = result['title']
    author = result['author']
    image_url = result['medium_image_url']
    item_url = result['item_url']
    
    {
      title: title,
      author: author,
      image_url: image_url,
      item_url: item_url
    }
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:username, :introduce, :image])
  end
  
  
  
end
