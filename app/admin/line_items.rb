ActiveAdmin.register LineItem do
  config.comments = false
  menu :parent => "Activities", :priority => 8, :label => proc{ I18n.t("LineItem") }
  show :title => I18n.t("LineItem") 
  index :title => I18n.t("LineItem") 
end
