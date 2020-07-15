class PagesController < ApplicationController
  def home

  user_input_city = params[:city]


  @url = "http://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=#{user_input_city}&distance=25&API_KEY=0946BB73-C3D4-4AA7-B34A-2EACA50879FF"
  @uri = URI(@url)
  @response = Net::HTTP.get(@uri)
  @output = JSON.parse(@response)
    
  @final_output = @output[0]['ReportingArea']
  @latitude = @output[0]['Latitude']
  @longitude = @output[0]['Longitude']
  @weather_forecast = @output[0]['Category']['Name']
      
  end
end
