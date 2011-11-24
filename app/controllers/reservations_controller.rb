class ReservationsController < ApplicationController
  
  before_filter :require_user
  
  def require_user
    if session[:user_id] == nil
      redirect_to root_url, :notice => "No way!"
    end
  end
    
  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @reservations }
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
    @user = User.find(session[:user_id])
    @reservation = @user.reservations.find(params[:id])
    
    if @reservation == nil
      redirect_to root_url, :notice => "Nice Try, Hacker!"
      return
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @reservation }
    end
  end

  # GET /reservations/new
  # GET /reservations/new.json
  def new    
    @user = User.find(session[:user_id])
    @flight = Flight.find(params[:flight_id])
    @reservation = Reservation.new
    @reservation.user = @user
    @reservation.flight = @flight
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @reservation }
    end
  end

  # GET /reservations/1/edit
  def edit

  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(params[:reservation])
    @reservation.user = User.find(session[:user_id])
    
    respond_to do |format|
      if @reservation.save
        ReservationsMailer.send_confirmation(@reservation).deliver
        format.html { redirect_to root_url, :notice => 'Reservation was successfully created.' }
        format.json { render :json => @reservation, :status => :created, :location => @reservation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reservations/1
  # PUT /reservations/1.json
  def update
    @reservation = Reservation.find(params[:id])

    respond_to do |format|
      if @reservation.update_attributes(params[:reservation])
        format.html { redirect_to @reservation, :notice => 'Reservation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @reservation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    user = User.find(session[:user_id])
    @reservation = user.reservations.find(params[:id])
    @reservation.destroy
    
    respond_to do |format|
      format.html { redirect_to user_url(user), :notice => "Your reservation to #{@reservation.flight.arrival_airport.city} has been cancelled." }
      format.json { head :ok }
    end
  end
end











