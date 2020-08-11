class PagesController < ApplicationController
  def home
    user_input_city = params[:city]

    @url = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{user_input_city}&distance=25&API_KEY=0946BB73-C3D4-4AA7-B34A-2EACA50879FF"
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @city = 'This city does not exist. Try Again.'
    else
      @city = @output[0]['ReportingArea']
      @latitude = @output[0]['Latitude']
      @longitude = @output[0]['Longitude']
      @weather_forecast = @output[0]['Category']['Name']
      @aqi = @output[0]['AQI']

        case @api_color
        when 1..50
          @api_color = 'green'
        when 51..100
          @api_color = 'yellow'
        when 101..150
          @api_color = 'orange'
        when 151..200
          @api_color = 'red'
        when 201..300
          @api_color = 'purple'
        when 301..500
          @api_color = 'maroon'
        else
          @api_color = 'light-grey'
        end
    end
  end
end
