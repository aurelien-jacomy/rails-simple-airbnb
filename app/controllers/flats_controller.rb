class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].nil?
      @flats = Flat.all.reverse
    else
      @search = params[:search][:query]
      @flats = Flat.where("name LIKE '%#{@search}%'").reverse
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(
      :name,
      :address,
      :description,
      :number_of_guests,
      :price_per_night,
      :picture_url
    )
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
