import Alamofire
import Foundation
import ObjectMapper
import Realm
import RealmSwift
import SnapKit
import UIKit

class CurrentWeatherViewController: UIViewController {

    private let kWeatherImageViewHeightMultiplier: CGFloat = 0.5

    private let kWeatherInfoStackViewMargin: CGFloat = 8
    private static let kWeatherInfoStackViewSpacing: CGFloat = 10

    private let city: City

    lazy var realm = try! Realm()

    private var actualWeather: Weather? {
        didSet {
           if let weather = actualWeather {
            (weather.labelsTexts.map { WeatherInfoLabel(infoType: $0.type.displayName, infoData: $0.content) })
                    .forEach {
                    self.weatherInfoStackView.addArrangedSubview($0)
                }
                
           } else {
              print("hahah")
            }
            setWeatherImage()
        }
    }

    private var mainScrollView = UIScrollView()

    private var contentView = UIView()
    
    private var requestIndicator = UIActivityIndicatorView()

    private var weatherInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = kWeatherInfoStackViewSpacing
        return stackView
    }()

    private var weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    init(city: City) {
        self.city = city
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
         navigationItem.hidesBackButton = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupConstraints()
    }

    private func setupNavigationBar() {
        navigationItem.title = city.name
        var buttonStyle: UIBarButtonSystemItem = .save
        let cityKey = CityRealm(city: city).name
        if realm.object(ofType: CityRealm.self, forPrimaryKey: cityKey) != nil {
            buttonStyle = .trash
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: buttonStyle, target: self, action: #selector(saveOrDeleteWeatherTap))
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(requestIndicator)
        setupRequestIndicator()
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(contentView)
        contentView.addSubview(weatherImageView)
        contentView.addSubview(weatherInfoStackView)
    }
    
    private func setupRequestIndicator() {
        requestIndicator.center = self.view.center
        requestIndicator.hidesWhenStopped = true
        requestIndicator.activityIndicatorViewStyle = .gray
    }

    private func setupConstraints() {
        mainScrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        weatherImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(kWeatherImageViewHeightMultiplier)
        }

        weatherInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(weatherImageView.snp.bottom)
            make.width.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().offset(kWeatherInfoStackViewMargin)
        }
    }

    func fetchWeatherDataFromAPI() {
        requestIndicator.startAnimating()
        
        let myRequest = WeatherRequest(city: city.name)

        myRequest.requestFailureHandler = { response, error in
            self.failureRequest(response: response, error: error)
        }

        myRequest.requestSuccessHandler = { response in
            self.successRequest(response: response)
        }

        APIClient.sharedInstance.makeRequest(baseRequest: myRequest)
    }

    private func failureRequest(response: DataResponse<Any>, error: Error?) {
        print(error.debugDescription)
        requestIndicator.stopAnimating()
    }

    private func successRequest(response: DataResponse<Any>) {
        do {
            guard let json = try JSONSerialization.jsonObject(with: response.data!, options: [])
                as? [String: Any] else {
                    print("error trying to convert rsponse data to JSON")
                    return
            }
            self.actualWeather = Mapper<Weather>().map(JSON: json)
        } catch {
            print("error trying to convert response data to JSON")
            return
        }
        requestIndicator.stopAnimating()
    }

    private func setWeatherImage() {
        var weatherImageName = "rain"

        if let conditions = actualWeather?.conditions {
            switch conditions {
            case .clearSky:
                weatherImageName = "sun"
            case .fewClouds:
                weatherImageName = "fewClouds"
            case .scatteredClouds, .brokenClouds, .overcastClouds:
                weatherImageName = "clouds"
            case .rain, .lightRain, .showerRain:
                weatherImageName = "rain"
            case .thunderstorm:
                weatherImageName = "storm"
            case .snow:
                weatherImageName = "snow"
            case .mist:
                weatherImageName = "mist"
            }
        }
        self.weatherImageView.image = UIImage(named: weatherImageName)
    }

    @objc private func saveOrDeleteWeatherTap() {
        let cityKey = CityRealm(city: city).name
        if let currentCity = realm.object(ofType: CityRealm.self, forPrimaryKey: cityKey) {
            try! realm.write {
                realm.delete(currentCity)
            }
        } else {
            city.weather = actualWeather
            let cityToSave = CityRealm(city: city)
            guard let weatherToSave = actualWeather else { return }
            try! realm.write {
                realm.add(cityToSave)
                realm.add(WeatherRealm(weather: weatherToSave))
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
    func setWeather(weather: Weather) {
        self.actualWeather = weather
    }

}
