Redmine::Plugin.register :redmine_custom_project do
  name 'Redmine Custom Project plugin'
  author 'BILEL KEDIDI'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/bilel-kedidi'
  author_url 'http://github.com/bilel-kedidi'

  settings :default => {
        'cp'  => 'Project type'
    }, :partial => 'redmine_cp/setting'

  menu :admin_menu, :auto_select_suggest, { :controller => 'auto_select_suggest', :action => 'index' }, :caption => 'Suggest auto select'
end

Rails.application.config.to_prepare do
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form, :partial=> 'redmine_cp/show_js'
  end
end
