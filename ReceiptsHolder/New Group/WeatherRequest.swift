import Alamofire
import Foundation

class WeatherRequest: BaseRequest {

    private let kWeatherAPIKey = "080160c375200215c36a1a7188b0ad70"

    init(city: String) {
        super.init()
        url = "https://api.openweathermap.org/data/2.5/weather"
        method = .get
        encoding = URLEncoding.methodDependent

        parameters = [
            "q": city,
            "APPID": kWeatherAPIKey,
            "units": "metric"

        ]
    }

}

//objectmapper to encode result from the server
