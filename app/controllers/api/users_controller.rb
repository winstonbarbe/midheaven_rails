class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render "index.json.jb", status: 200
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render "show.json.jb", status: 200
  end

  def update
    @user = User.find(params[:id])
    
    @user.name = params[:name] || @user.name
    @user.email = params[:email] ||  @user.email
    @user.sun = params[:sun] || @user.sun
    @user.moon = params[:moon] || @user.moon
    @user.ascending = params[:ascending] || @user.ascending
    @user.mercury = params[:mercury] || @user.mercury
    @user.venus = params[:venus] || @user.venus
    @user.mars = params[:mars] || @user.mars
    @user.birthday = params[:birthday] || @user.birthday
    @user.birth_time = params[:birth_time] || @user.birth_time
    @user.birth_location = params[:birth_location] || @user.birth_location
    @user.gender = params[:gender] || @user.gender 
    @user.interested_in = params[:interested_in] || @user.interested_in
    @user.seen_by = params[:seen_by] || @user.seen_by
    @user.pronouns = params[:pronouns] || @user.pronouns
    @user.bio = params[:bio] || @user.bio
    @user.current_location = params[:current_location] || @user.current_location

    if params[:password]
      if @user.authenticate(params[:old_password])
        @user.update!(
          password: params[:password],
          password_confirmation: params[:password_confirmation],
        )
      end
    end
    if @user.save
      render "show.json.jb", status: 201
    else 
      render json: { errors: @user.errors.full_messages}, status: 400
    end
  end
end
