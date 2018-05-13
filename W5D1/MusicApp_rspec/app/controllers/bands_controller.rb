class BandsController < ApplicationController

  before_action :require_login, except: :index

  def index
    @bands = Band.all
    render :index
  end
  def show
    @band = Band.find_by(id: params[:id])

    if @band
      render :show
    else
      redirect_to bands_url
    end
  end

  def new
    @band = Band.new
    render :new
  end
  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])

    if @band
      render :edit
    else
      redirect_to bands_url
    end
  end
  def update
    @band = Band.find_by(id: params[:id])

    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash[:erros] = @band.errors.full_messages
      redirect_to bands_url
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
