class Spree::Admin::PagesController < Spree::Admin::ResourceController
  update.after :expire_cache

  def new
    @page = @object
  end

  def edit
    @page = @object
  end
  
  def mercury_update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end

  private
  def expire_cache
    expire_fragment "spree_static_content" + @object.slug + "_spree_static_content"
  end
end
