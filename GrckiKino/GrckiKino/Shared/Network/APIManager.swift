//
//  APIManager.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation
import Alamofire

class APIManager {
    static let shared = APIManager()
    private init () {}
    
    var isConnectedToInternet: Bool {
        let networkManager = NetworkReachabilityManager()
        return networkManager?.isReachable ?? false
    }
    
    //MARK:- Constants
    private enum Constants {
        static let defaultAlertTitle = "warning"
        static let errorAlertTitle = "error"
        static let genericErrorMessage = "Something went wrong, please try again."
    }
    
    //MARK:- Usual api request
    public func sendRequest<T>(url:ServerApi,
                               method: HTTPMethod? = .get,
                               parameters:[String:Any]? = nil,
                               encoding: JSONEncoding? = .default,
                               handler: @escaping (Swift.Result<T,AlertMessage>)-> Void) where T:Codable {
        AF.request(url.url,
                   method: method ?? .get,
                   parameters: parameters,
                   encoding: encoding ?? .default)
            
            .responseJSON { response in
                
                switch response.result {
                case .success( _):
                    do {
                        let data = try JSONDecoder().decode(T.self, from: response.data!)
                        handler(.success(data))
                        break
                    }
                    catch {
                        if let error = error as? AlertMessage {
                            return handler(.failure(error))
                        }
                        handler(.failure(self.parseApiError(data: response.data)))
                        break
                    }
                case .failure(let error):
                    handler(.failure(AlertMessage(title: "Common.Error".localized,
                                                  body: error.errorDescription ?? "Alert.Message.Default".localized)))
                    break
                }
            }
        
    }
    
    /// API request for urls with sufix at the end
    public func sendRequestURLEditable<T>(url:String,
                               method: HTTPMethod? = .get,
                               parameters:[String:Any]? = nil,
                               encoding: JSONEncoding? = .default,
                               handler: @escaping (Swift.Result<T,AlertMessage>)-> Void) where T:Codable {
        self.isServerAvailable({ (isAvailable) in
            guard isAvailable else { handler(.failure(AlertMessage(title: "Alert.Title.NoInternet".localized,
                                                                   body: "Alert.Message.NoInternet".localized))); return }
            AF.request(url,
                       method: method ?? .get,
                       parameters: parameters,
                       encoding: encoding ?? .default)
                
                .responseJSON { response in
                    switch response.result {
                    case .success( _):
                        do {
                            let data = try JSONDecoder().decode(T.self, from: response.data!)
                            handler(.success(data))
                            break
                        }
                        catch {
                            if let error = error as? AlertMessage {
                                return handler(.failure(error))
                            }
                            handler(.failure(self.parseApiError(data: response.data)))
                            break
                        }
                    case .failure(let error):
                        handler(.failure(AlertMessage(title: "Common.Error".localized,
                                                      body: error.errorDescription ?? "Alert.Message.Default".localized)))
                        break
                    }
            }
        })
    }
    
    ///Checks is server available
    func isServerAvailable(_ completion: @escaping (Bool) -> Void) {
        AF.request(ServerApi.ping.url,
                   method: .get,
                   parameters: nil,
                   encoding: JSONEncoding.default)
            .responseJSON { response in
                response.response?.statusCode == 200 ? completion(true) : completion(false)
        }
    }

    
    
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: Constants.errorAlertTitle, body: error.key ?? error.message)
        }
        return AlertMessage(title: Constants.errorAlertTitle, body: Constants.genericErrorMessage)
    }
}

