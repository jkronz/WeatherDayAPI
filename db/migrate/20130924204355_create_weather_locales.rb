class CreateWeatherLocales < ActiveRecord::Migration
  def change
    create_table :weather_locales do |t|
        t.string :link
		t.string :time_zone
    	t.string :name
    	t.integer :avg_high_f
    	t.integer :avg_high_c
    	t.integer :avg_low_f
    	t.integer :avg_low_c
    	t.integer :precip
    	t.integer :todays_high_f 
    	t.integer :todays_high_c 
    	t.integer :todays_low_f 
    	t.integer :todays_low_c 
      t.timestamps      
    end
  end
end
