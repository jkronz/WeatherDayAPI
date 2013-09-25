class WundergroundApi
	class << self	
		def forecast_request(weather_locale)
			url = "http://api.wunderground.com/api/#{$app_config['wunderground']['api_key']}/almanac/forecast#{weather_locale.link}.json"
			request = Typhoeus::Request.new(url)
			request.on_complete { |response| WundergroundApi.parse_response(weather_locale, response) }
			request
		end

		def parse_response(weather_locale, response)
			forecast_attributes = {}
			if response.code == 200
				json = JSON.parse(response.body)
				forecast_attributes = {
					weather_locale: weather_locale,
		    	avg_high_f: json['almanac']['temp_high']['normal']['F'].to_i,
		    	avg_high_c: json['almanac']['temp_high']['normal']['C'].to_i,
		    	avg_low_f: json['almanac']['temp_low']['normal']['F'].to_i,
		    	avg_low_c: json['almanac']['temp_low']['normal']['C'].to_i,
		    	precip: json['forecast']['simpleforecast']['forecastday'][0]['pop'].to_i,
		    	todays_high_f: json['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit'].to_i,
		    	todays_high_c: json['forecast']['simpleforecast']['forecastday'][0]['high']['celsius'].to_i,
		    	todays_low_f: json['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit'].to_i,
		    	todays_low_c: json['forecast']['simpleforecast']['forecastday'][0]['low']['celsius'].to_i
				}	
				ForecastDay.create!(forecast_attributes)			
			else
				Rails.logger.error("Wunderground returned error code #{response.code}: #{response.body}")
			end
			forecast_attributes
		end		

		#pass a collection of weather_locales
		def trigger_locales(locales)
			hydra = Typhoeus::Hydra.hydra
			requests = locales.map { |locale| forecast_request(locale) }		
			requests.each { |request| hydra.queue(request) }
			hydra.run
		end		

	end

end
