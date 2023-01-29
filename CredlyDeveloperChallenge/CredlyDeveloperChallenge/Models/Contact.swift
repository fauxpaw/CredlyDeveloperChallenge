//
//  Contact.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/27/23.
//

import Foundation

struct UserContact: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
}

struct UserContactAddress: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

struct UserContactCompany: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}
