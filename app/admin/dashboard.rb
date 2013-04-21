ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("Dashboard") }
  
  content :title => proc{ I18n.t("Dashboard") } do
      columns do
        column do
          panel I18n.t("Recent Scan") do
              table_for Variant.order('updated_at desc').limit(10).each do |variant|
                  column(I18n.t("Verified"))   {|variant| variant.checked } 
                  #column(I18n.t("Retry"))   {|variant| variant.retry_count } 
                  column(I18n.t("Code"))    {|variant| variant.fullcode } 
                  column(I18n.t("User"))    {|variant| variant.user.nil? ? '' : link_to(variant.user.phone, admin_user_path(variant.user))} 
              end
          end
        end

        column do
          panel I18n.t("Recent User") do
              table_for User.order('updated_at desc').limit(10).each do |user|
                  column(I18n.t("UserTag.Phone"))   {|user| link_to(user.phone, admin_user_path(user)) } 
                  column(I18n.t("UserTag.Credit"))   {|user| user.credit } 
              end
          end
        end
      end

      columns do
        column do
          panel I18n.t("Scan HotSpot") do
            div do

              @json = Variant.all().to_gmaps4rails do |variant, marker|
                marker.json({ :id => variant.id, :title => variant.product.name })
              end

              render('/admin/variant/hotspot', :data => @json)
            end
          end
        end
      end # columns
  end
end
