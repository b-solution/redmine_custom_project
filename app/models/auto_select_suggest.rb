class AutoSelectSuggest < ActiveRecord::Base
  unloadable
  def self.get_hash(cf)
    auto_ss = where(cf: cf).first
    values = if auto_ss
               YAML::load(auto_ss.values)
             else
               {
                   'enabled_module_names'=> [''],
                   'tracker_ids'=>[''],
                   'issue_custom_field_ids'=>['']
               }
             end
    values.stringify_keys
  end

  def self.set_hash(cf, hash)
    setting = (hash || {}).dup.symbolize_keys
    auto_ss = where(cf: cf).first_or_initialize
    auto_ss.values = YAML::dump(setting)
    auto_ss.save
  end
end
