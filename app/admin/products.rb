ActiveAdmin.register Product do
    menu :priority => 6, :label => proc{ I18n.t("Product") }
	show :title => I18n.t("Product") 
	index :title => I18n.t("Product") 

	index :as => :grid, :default => true do |product|
      link_to(image_tag(product.image_path), admin_product_path(product))
    end
end
