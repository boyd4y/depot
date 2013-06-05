ActiveAdmin.register User do
  config.comments = false
  menu :priority => 10, :label => proc{ I18n.t("User") }
  # show :title => I18n.t("User") 
  # index :title => I18n.t("User") 
end
