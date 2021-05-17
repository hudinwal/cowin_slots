require 'faraday'
require 'faraday_middleware'

def get_vaccine_centers(pincode, date)
    formatted_date = formatted_date(date)
    url = 'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByPin?'
    conn = Faraday.new(url: url, params: { pincode: pincode, date: formatted_date}) do |faraday|
        #faraday.response :logger, nil, { headers: true, bodies: true }
        faraday.response :json
    end 
    conn.get do |req|
        req.options[:timeout] = 5  
    end
end

def formatted_date(date)
    date.to_s.split("-").reverse().join("-")
end