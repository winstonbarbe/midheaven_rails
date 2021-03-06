class Api::UsersController < ApplicationController

  before_action :authenticate_user, except: :create
  
  def index
    @users = current_user.compatibles
    # render json: @users
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
    coordinates = Geocoder.search(params[:current_location]).first.coordinates
    
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
    @user.latitude = coordinates[0]  || @user.latitudech
    @user.longitude = coordinates[1] || @user.longitude

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

  def destroy
    User.find(current_user.id).destroy
    render json: { message: "Account destroyed" }, status: 201
  end
end
