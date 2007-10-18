class HomeController < ApplicationController  
  
  def index
    if logged_in?
      @date = Time.parse("#{params[:date]} || TzTime.now")
      @topics = Topic.find(:all, :limit => 30, :include => [:user, :forum, :last_poster], :order => 'topics.last_post_at desc')
      @events = Event.find(:all, :limit => 30, :order => 'updated_at desc')
      @uploads = Upload.find(:all, :limit => 5, :include => :user, :order => 'uploads.updated_at desc')
      @headers = Header.find(:all, :limit => 3, :include => :user, :order => 'headers.created_at desc')
      @users = User.find(:all, :limit => 3, :order => 'profile_updated_at desc')
      @avatars = Avatar.find(:all, :limit => 3, :include => :user, :order => 'avatars.updated_at desc')
    else
      render(:template => "users/login")
    end
  end
  
end
