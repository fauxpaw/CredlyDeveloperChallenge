//
//  Networking.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/27/23.
//

import Foundation
import Alamofire
import SwiftyJSON

enum APIError: Error {
    case unknown(String)
    case missingData
    case unhandledStatusCode(Int)
    case serverError(String)
}

enum UsersListApiResponse {
    case Success([UserContact])
    case Fail(APIError)
}

class API {
    
    /// Fetch users leveraging decodable
    static func getUsers(completion: @escaping ([UserContact]) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/users").responseDecodable(of: [UserContact].self) { response in
            
            switch response.result {
            case .success(let users):
                completion(users)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
    
    /// Fetch users leveraging SwiftyJson
    static func getSwfityUsers(completion: @escaping (UsersListApiResponse)-> Void) {
        AF.request("https://jsonplaceholder.typicode.com/users").validate(statusCode: 200..<500)
            .response(completionHandler: { (response) in
                switch response.result {
                case .success(_):
                    switch response.response?.statusCode {
                    case 200:
                        var contacts = [UserContact]()
                        guard let data = response.data else {
                            completion(.Fail(APIError.missingData))
                            return
                        }
                        do {
                            let json = try JSON(data: data)
                            for (_, subJson):(String, JSON) in json {
                                let name = subJson["name"].stringValue
                                let username = subJson["username"].stringValue
                                let email = subJson["email"].stringValue
                                let id = subJson["id"].intValue
                                let phone = subJson["phone"].stringValue
                                let contact = UserContact(id: id, name: name, username: username, email: email, phone: phone)
                                contacts.append(contact)
                            }
                            completion(.Success(contacts))
                        } catch (let error) {
                            completion(.Fail(APIError.unknown(error.localizedDescription)))
                        }
                    default:
                        if let code = response.response?.statusCode {
                            completion(.Fail(APIError.unhandledStatusCode(code)))
                            return
                        }
                    }
                case .failure(let error):
                    completion(.Fail(APIError.serverError(error.localizedDescription)))
                }
            })
    }
}
