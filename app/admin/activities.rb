ActiveAdmin.register Activity do
  menu :priority => 7, :label => proc{ I18n.t("Activity") }
  # show :title => I18n.t("Activity") 
  # index :title => I18n.t("Activity") 

	index :as => :grid, :default => true do |activity|
  		link_to(image_tag(activity.imageurl), admin_activity_path(activity))
	end
end
