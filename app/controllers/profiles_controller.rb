class ProfilesController < ApplicationController
  def index
    @users = users
  end

  def users
    query = User.ransack(user_name_cont: search_query)
    @users = query.result(distince: true)
  end

  def search_query
    params[:query]
  end
end
