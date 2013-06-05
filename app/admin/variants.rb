ActiveAdmin.register Variant do
  config.comments = false
  menu :priority => 9, :label => proc{ I18n.t("Variant") }
  show :title => I18n.t("Variant") 
  index :title => I18n.t("Variant") 

	member_action :showcode do
		variant = Variant.find(params[:id])
		# redirect_to URI.encode("http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=#{variant.fullcode}&chld=H|0")
		@image = URI.encode("http://chart.apis.google.com/chart?cht=qr&chs=300x300&chl=#{variant.fullcode}&chld=H|0")
		respond_to do |format|
      		format.html # show.html.erb
      		format.json { render json: @variant }
    	end
	end

 	action_item :only => :show do
 		link_to(I18n.t('View QR Code'), :action => "showcode")
    end
end
