class CreateWeatherLocales < ActiveRecord::Migration
  def change
    create_table :weather_locales do |t|
			t.string :link
    	t.string :name
      t.timestamps      
    end
  end
end
