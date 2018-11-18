import Foundation
import Realm
import RealmSwift

final class WeatherRealm: Object {
    
    @objc dynamic var temperature: Double = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var windSpeed: Double = 0
    @objc dynamic var weatherDesc: String = ""
    @objc dynamic var conditionsRawValue: String = ""
    
    var conditions: WeatherDesc? {
        get {
            return WeatherDesc(rawValue: conditionsRawValue)
        }
        set {
            if let newValue = newValue {
                conditionsRawValue = newValue.rawValue
            }
        }
    }
    
    init(weather: Weather) {
        self.temperature = weather.temperature
        self.pressure = weather.pressure
        self.humidity = weather.humidity
        self.windSpeed = weather.windSpeed
        self.weatherDesc = weather.weatherDesc
        super.init()
        self.conditions = weather.conditions
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    func toWeather() -> Weather {
        return Weather(temperature: temperature, pressure: pressure, humidity: humidity, windSpeed: windSpeed, weatherDesc: weatherDesc, conditions: conditions)
    }
}
