# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'auto_select_suggest/index', controller: 'auto_select_suggest', action: 'index'
post 'auto_select_suggest/update', controller: 'auto_select_suggest', action: 'update'
get 'auto_select_suggest/update_project', controller: 'auto_select_suggest', action: 'update_project'