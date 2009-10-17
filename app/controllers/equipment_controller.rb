class EquipmentController < ApplicationController
  def index
    @search = current_user_role.equipment.search(params[:search])
    @equipment, @equipment_count = @search.all.paginate(:per_page => 5, :page => params[:page]), @search.count
  end
  
  def show
    @equipment = current_user_role.equipment.find(params[:id])
  end
  
  def new
    @equipment = current_user_role.equipment.build
  end
  
  def create
    @equipment = current_user_role.equipment.build(params[:equipment])
    if @equipment.save
      flash[:notice] = "Successfully created equipment."
      redirect_to @equipment
    else
      render :action => 'new'
    end
  end
  
  def edit
    @equipment = current_user_role.equipment.find(params[:id])
  end
  
  def update
    @equipment = current_user_role.equipment.find(params[:id])
    if @equipment.update_attributes(params[:equipment])
      flash[:notice] = "Successfully updated equipment."
      redirect_to @equipment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if current_user_role.has_role? Administrator
      @equipment = current_user_role.equipment.find(params[:id])
      @equipment.destroy
      flash[:notice] = "Successfully destroyed equipment."
      redirect_to equipment_url
    else
      flash[:error] = "Unauthorized action."
      redirect_to equipment_url
    end

  end
end
