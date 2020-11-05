class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render ({ :template => "photo_templates/index.html.erb"})
  end

def show
   p url_photo = params.fetch("photo_num")
   p matching_photo = Photo.where({ :id => url_photo})
    @the_photo = matching_photo.at(0)
    if @the_photo ==nil
      redirect_to("/")
    else 
      render ({ :template => "photo_templates/show.html.erb"})
    end
  end 

  def del
    
   p url_photo = params.fetch("p_id")
   p matching_photo = Photo.where({ :id => url_photo})
    the_photo = matching_photo.at(0)
    the_photo.destroy
    redirect_to("/photos")
  end

#update_photo/777?input_image=https%3A%2F%2Frobohash.org%2Fdolorehicincidunt.png%3Fsize%3D300x300%26set%3Dset1&input_caption=Once+you%E2%80%99ve+accepted+your+flaws%2C+no+one1+can+use+them+against+you.

  
  def update
   query_image= params.fetch("input_image")
   query_caption= params.fetch("input_caption")
   query_photo_id= params.fetch("up_id")
   matching_photo = Photo.where({:id => query_photo_id}).at(0)
   matching_photo.image = query_image
   matching_photo.caption = query_caption
   matching_photo.save
   redirect_to("/photos/"+ matching_photo.id.to_s)
  end

  def insert
   query_image= params.fetch("input_image")
   query_caption= params.fetch("input_caption")
   query_owner_id= params.fetch("input_owner_id")
   a_new_photo=Photo.new 
   a_new_photo.image = query_image
   a_new_photo.caption = query_caption
   a_new_photo.owner_id = query_owner_id
   a_new_photo.save
   redirect_to("/photos/"+ a_new_photo.owner_id.to_s)
  end

  def comment
  
   query_image= params.fetch("input_photo_id")
   query_caption= params.fetch("input_body")
   query_owner_id= params.fetch("input_author_id")
   a_new_comment=Comment.new 
   a_new_comment.photo_id = query_image
   a_new_comment.body = query_caption
   a_new_comment.author_id = query_owner_id
   a_new_comment.save
   redirect_to("/photos/"+ a_new_comment.photo_id.to_s)
  end

end