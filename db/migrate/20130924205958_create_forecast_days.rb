class CreateForecastDays < ActiveRecord::Migration
  def change
    create_table :forecast_days do |t|
    	t.integer :weather_locale_id
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
