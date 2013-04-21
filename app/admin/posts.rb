ActiveAdmin.register Post do
    menu :priority => 9, :label => proc{ I18n.t("Post") }
	show :title => I18n.t("Post") 
	index :title => I18n.t("Post") 

	index :as => :blog, :default => true do |post|
		title :title
    	body :message # Return value of #my_body will be the body
  	end
end
