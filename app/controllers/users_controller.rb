class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
     
    render ({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")
    matching_user = User.where({ :username => url_username})
    @the_user = matching_user.at(0)
    if @the_user ==nil
      redirect_to("/")
    else 
      render ({ :template => "user_templates/show.html.erb"})
    end
  end 

  def update
   query_user_id= params.fetch("u_id")
   query_username= params.fetch("input_username")
   matching_user = User.where({:id => query_user_id}).at(0)
   matching_user.username = query_username
   matching_user.save
   redirect_to("/users/"+ matching_user.username)
  end

    def insert
      query_user= params.fetch("input_username")
      a_new_user=User.new 
      a_new_user.username = query_user
      a_new_user.save
      redirect_to("/users/"+ a_new_user.username)
    end

end