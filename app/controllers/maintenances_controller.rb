class MaintenancesController < ApplicationController
  before_filter :authorize
  
  def index
    @search = current_user_role.maintenances.search(params[:search])
    @maintenances, @maintenances_count = @search.all(:include => [ :equipment, :client, :technician ]).paginate(:per_page => 10, :page => params[:page]), @search.count
  end
  
  def show
    @maintenance = current_user_role.maintenances.find(params[:id])
  end
  
  def new
    @maintenance = current_user_role.maintenances.build
  end
  
  def create
    @maintenance = current_user_role.maintenances.build(params[:maintenance])
    if @maintenance.save
      flash[:notice] = "Successfully created maintenance."
      redirect_to @maintenance
    else
      render :action => 'new'
    end
  end
  
  def edit
    @maintenance = current_user_role.maintenances.find(params[:id])
  end
  
  def update
    @maintenance = current_user_role.maintenances.find(params[:id])
    if @maintenance.update_attributes(params[:maintenance])
      flash[:notice] = "Successfully updated maintenance."
      redirect_to @maintenance
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @maintenance = current_user_role.maintenances.find(params[:id])
    @maintenance.destroy
    flash[:notice] = "Successfully destroyed maintenance."
    redirect_to maintenances_url
  end
end
