import Alamofire
import Foundation

class BaseRequest {

    var url: String = ""
    var method: HTTPMethod = .get
    var parameters: [String: Any] = [:]
    var encoding: URLEncoding = URLEncoding.methodDependent

    var requestSuccessHandler: ((DataResponse<Any>) -> Void)?
    var requestFailureHandler: ((DataResponse<Any>, Error?) -> Void)?

}
