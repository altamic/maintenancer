require 'test_helper'

class MaintenancesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Maintenance.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Maintenance.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Maintenance.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to maintenance_url(assigns(:maintenance))
  end
  
  def test_edit
    get :edit, :id => Maintenance.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Maintenance.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Maintenance.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Maintenance.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Maintenance.first
    assert_redirected_to maintenance_url(assigns(:maintenance))
  end
  
  def test_destroy
    maintenance = Maintenance.first
    delete :destroy, :id => maintenance
    assert_redirected_to maintenances_url
    assert !Maintenance.exists?(maintenance.id)
  end
end
