class CreateAutoSelectSuggests < ActiveRecord::Migration
  def change
    create_table :auto_select_suggests do |t|
      t.string :cf
      t.text :values
    end
  end
end
