class AutoSelectSuggestController < ApplicationController
  unloadable

  def index
    @issue_custom_fields = IssueCustomField.sorted.all
    @trackers = Tracker.sorted.all
    respond_to do |format|
      format.html{
        cp = Setting.send("plugin_redmine_custom_project")['cp']
        @cf = CustomField.where(type: 'ProjectCustomField').where(name: cp).first
        @values = AutoSelectSuggest.get_hash(@cf.possible_values.first)
      }
      format.js{
        @values =  AutoSelectSuggest.get_hash(params[:cf])
      }
    end
  end

  def update
    cf = params['custom_field']
    suggest = params['suggest']
    AutoSelectSuggest.set_hash(cf, suggest)
    flash[:notice] = "Success"
    redirect_to '/auto_select_suggest/index'
  end

  def update_project
    @values =  AutoSelectSuggest.get_hash(params[:cf])
  end
end
