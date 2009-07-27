  def show
    @<%= plural_name %> = <%= class_name %>.find(:all)
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
  end
