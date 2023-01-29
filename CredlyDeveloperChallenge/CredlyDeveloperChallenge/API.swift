//
//  Networking.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/27/23.
//

import Foundation
import Alamofire

class API {

    static func getUsers(completion: @escaping ([UserContact]) -> Void) {
        AF.request("https://jsonplaceholder.typicode.com/users").responseDecodable(of: [UserContact].self) { response in
            
            switch response.result {
            case .success(let users):
                completion(users)
//                debugPrint(users)
            case .failure(let error):
                print(error.localizedDescription)
                completion([])
            }
        }
    }
    
}
