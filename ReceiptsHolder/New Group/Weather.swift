import Foundation
import ObjectMapper

enum WeatherInfo: String {

    case temperature,
    pressure,
    humidity,
    windSpeed = "wind speed",
    weatherDesc

    var displayName: String {
        switch self {
        case .temperature:
            return rawValue.capitalized + "(ºC)"
        case .pressure:
            return rawValue.capitalized + "(p)"
        case .humidity:
            return rawValue.capitalized + "(f)"
        case .windSpeed:
            return rawValue.capitalized + "(km/h)"
        case .weatherDesc:
            return "Conditions"
        }
    }

}

enum WeatherDesc: String {

    case clearSky = "clear sky",
    fewClouds = "few clouds",
    scatteredClouds = "scattered clouds",
    overcastClouds = "overcast clouds",
    brokenClouds = "broken clouds",
    showerRain = "shower rain",
    rain,
    lightRain = "light rain",
    thunderstorm,
    snow,
    mist

}

class Weather: ImmutableMappable {

    var temperature: Double
    var pressure: Int
    var humidity: Int
    var windSpeed: Double
    var weatherDesc: String
    var conditions: WeatherDesc?

    var labelsTexts: [(type: WeatherInfo, content: String)] {
        return [(type: .temperature, content: "\(temperature)"),
                (type: .humidity, content: "\(humidity)"),
                (type: .pressure, content: "\(pressure)"),
                (type: .windSpeed, content: "\(windSpeed)"),
                (type: .weatherDesc, content: "\(weatherDesc)")]
    }

    required init(map: Map) throws {
        temperature = try map.value("main.temp")
        pressure = try map.value("main.pressure")
        humidity = try map.value("main.humidity")
        windSpeed = try map.value("wind.speed")
        weatherDesc = try map.value("weather.0.description")
        conditions = WeatherDesc(rawValue: weatherDesc)
    }

    func mapping(map: Map) {

    }
    
    init(temperature: Double, pressure: Int, humidity: Int, windSpeed: Double, weatherDesc: String, conditions: WeatherDesc?) {
        self.temperature = temperature
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.weatherDesc = weatherDesc
        self.conditions = conditions
    }

}
