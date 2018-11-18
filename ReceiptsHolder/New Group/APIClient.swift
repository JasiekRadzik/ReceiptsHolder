import Alamofire
import Foundation

class APIClient {

    static let sharedInstance = APIClient()

    private init() {

    }

    func makeRequest(baseRequest: BaseRequest) {

        Alamofire.request(baseRequest.url, method: baseRequest.method, parameters: baseRequest.parameters, encoding: baseRequest.encoding).responseJSON { response in
            switch response.result {
            case .success:
                baseRequest.requestSuccessHandler?(response)
            case .failure:
                guard let error = response.error else {
                    return
                }
                baseRequest.requestFailureHandler?(response, error)
            }
        }
    }

}
