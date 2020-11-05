Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_num", { :controller => "photos", :action => "show"})
  get("/delete_photo/:p_id", { :controller => "photos", :action => "del"})
  get("/insert_photo", { :controller => "photos", :action => "insert"})
  get("/insert_comment_record", { :controller => "photos", :action => "comment"})
  get("/insert_user_record", { :controller => "users", :action => "insert"})
  get("/update_photo/:up_id", { :controller => "photos", :action => "update"})
  get("/update_user/:u_id", { :controller => "users", :action => "update"})
  
end