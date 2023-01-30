//
//  Networking.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/27/23.
//

import Foundation
import Alamofire
import SwiftyJSON

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
    static func getSwfityUsers(completion: @escaping ([UserContact])-> Void) {
        AF.request("https://jsonplaceholder.typicode.com/users").response { response in
            
            var contacts = [UserContact]()
            guard let data = response.data else {
                // TODO: error handling
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
            } catch (let error) {
                print(error.localizedDescription)
            }
            completion(contacts)
        }
    }
    
}
