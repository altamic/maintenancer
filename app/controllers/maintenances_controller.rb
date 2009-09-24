class MaintenancesController < ApplicationController
  before_filter :authorize
  
  def index
    @search = Maintenance.search(params[:search])
    @maintenances, @maintenances_count = @search.all(:include => [ :equipment, :client, :technician ]).paginate(:per_page => 15, :page => params[:page]), @search.count
  end
  
  def show
    @maintenance = Maintenance.find(params[:id])
  end
  
  def new
    @maintenance = Maintenance.new
  end
  
  def create
    @maintenance = Maintenance.new(params[:maintenance])
    if @maintenance.save
      flash[:notice] = "Successfully created maintenance."
      redirect_to @maintenance
    else
      render :action => 'new'
    end
  end
  
  def edit
    @maintenance = Maintenance.find(params[:id])
  end
  
  def update
    @maintenance = Maintenance.find(params[:id])
    if @maintenance.update_attributes(params[:maintenance])
      flash[:notice] = "Successfully updated maintenance."
      redirect_to @maintenance
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @maintenance = Maintenance.find(params[:id])
    @maintenance.destroy
    flash[:notice] = "Successfully destroyed maintenance."
    redirect_to maintenances_url
  end
end
