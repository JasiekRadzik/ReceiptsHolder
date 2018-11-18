import Foundation
import Realm
import RealmSwift

final class CityRealm: Object {

    @objc dynamic var name = ""
    @objc dynamic var state: String?
    @objc dynamic var country = ""
    @objc dynamic var weather: WeatherRealm?

    init(city: City) {
        self.name = city.name
        self.state = city.state
        self.country = city.country
        if let weather = city.weather {
            self.weather = WeatherRealm(weather: weather)
        }
        super.init()
    }

    override static func primaryKey() -> String? {
        return "name"
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

    func toCity() -> City? {
        return City(name: name, state: state, country: country, weather: weather?.toWeather())
    }
}
