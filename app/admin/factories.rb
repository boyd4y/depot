ActiveAdmin.register Factory do
  config.comments = false
  menu :parent => "Companies", :priority => 4, :label => proc{ I18n.t("Factory") }
  # show :title => I18n.t("Factory") 
  # index :title => I18n.t("Factory") 

  index :as => :grid, :default => true do |factory|
      link_to(image_tag(factory.logo), admin_factory_path(factory))
  end
end
