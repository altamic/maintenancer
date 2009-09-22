class EquipmentsController < ApplicationController
  def index
    @search = Equipment.search(params[:search])
    @equipments, @equipments_count = @search.all.paginate(:per_page => 5, :page => params[:page]), @search.count
  end
  
  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def new
    @equipment = Equipment.new
  end
  
  def create
    @equipment = Equipment.new(params[:equipment])
    if @equipment.save
      flash[:notice] = "Successfully created equipment."
      redirect_to @equipment
    else
      render :action => 'new'
    end
  end
  
  def edit
    @equipment = Equipment.find(params[:id])
  end
  
  def update
    @equipment = Equipment.find(params[:id])
    if @equipment.update_attributes(params[:equipment])
      flash[:notice] = "Successfully updated equipment."
      redirect_to @equipment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @equipment = Equipment.find(params[:id])
    @equipment.destroy
    flash[:notice] = "Successfully destroyed equipment."
    redirect_to equipments_url
  end
end
