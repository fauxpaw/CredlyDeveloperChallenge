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
    
    /// Attempts to leverage PersonNameComponents to give us the given name and family name format. If this is not available will default to the name string contained in our JSON response
    var formattedName: String? {
        do {
            let nameComponents = try PersonNameComponents(name)
            return nameComponents.formatted(.name(style: .medium))
        } catch (let error) {
            print(error.localizedDescription)
        }
        return name
    }
    
    var initials: String {
        do {
            let nameComponents = try PersonNameComponents(name)
            return nameComponents.formatted(.name(style: .abbreviated))
        } catch (let error) {
            print(error.localizedDescription)
        }
        return name
    }
    
    var formattedPhone: String {
        let components = phone.components(separatedBy: " x")
        switch components.count {
        case 1:
            return basePhoneParser(phone: phone)
        case 2:
            return "\(basePhoneParser(phone: components[0])) ext: \(components[1])"
        default:
            return phone
        }
    }
    
    /// Converts a phone number string to the form (###) ###-#### or +## (###) ###-#### when country code is present
    private func basePhoneParser(phone: String) -> String {
        let rawNumberString = phone.replacing(/[()\\.-]+/, with: "") // filter out all special characters commonly found in phone number strings
        switch rawNumberString.count {
        case 10:
            let last4 = rawNumberString.suffix(4)
            let first3 = rawNumberString.dropLast(4).suffix(3)
            let zipCode = rawNumberString.prefix(3)
            return "(\(zipCode)) \(first3)-\(last4)"
        case 11..<12:
            let last4 = rawNumberString.suffix(4)
            let first3 = rawNumberString.dropLast(4).suffix(3)
            let zipCode = rawNumberString.dropLast(7).suffix(3)
            let countryCode = rawNumberString.dropLast(10)
            return "+\(countryCode) (\(zipCode)) \(first3)-\(last4)"
        default:
            return rawNumberString
        }
    }
}
