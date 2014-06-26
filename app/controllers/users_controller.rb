class UsersController < ApplicationController
   before_filter :login_required,:all_user
   
   def profile
     @user = User.find_by_name(params[:name])
     @followers=@user.followed_users
     # User.find_by_username(params[:id])
     @tweet=@user.tweets.new     
   end
   
   def my_following
     follwing_user=User.find params[:id]   
     current_user.relationships.create!(followed_id: follwing_user.id) 
     redirect_to root_path
   end
   
   
end
