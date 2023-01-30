//
//  CredlyDeveloperChallengeTests.swift
//  CredlyDeveloperChallengeTests
//
//  Created by Michael Sweeney on 1/26/23.
//

import XCTest
@testable import CredlyDeveloperChallenge

final class CredlyDeveloperChallengeTests: XCTestCase {
    
    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testFullNameFormated_identity() throws {
        let expectedResult = "Leanne Graham"
        let contact = UserContact(id: 1, name: "Leanne Graham", username: "leagram", email: "fake@fake.com", phone: "8675309")
        XCTAssertEqual(contact.formattedName, expectedResult)
    }
    
    func testFormattedNameWithPrefix() throws {
        let expectedResult = "Dennis Schulist"
        let contact = UserContact(id: 1, name: "Mrs. Dennis Schulist", username: "dschul", email: "fake@fake.com", phone: "8675309")
        XCTAssertEqual(contact.formattedName, expectedResult)
    }
    
    func testFormattedUKPhoneNumber() throws {
        let expectedResult = "(586) 493-6943"
        let contact = UserContact(id: 1, name: "John Doe", username: "jd", email: "fake@fake", phone: "586.493.6943")
        XCTAssertEqual(contact.formattedPhone, expectedResult)
    }
    
    func testFormattedPhoneNumberWithExtension() throws {
        let expectedResult = "+1 (477) 935-8478 ext: 6430"
        let contact = UserContact(id: 1, name: "John Doe", username: "jd", email: "fake@fake.com", phone: "1-477-935-8478 x6430")
        XCTAssertEqual(contact.formattedPhone, expectedResult)
    }
    
    func testFormattedDashedPhoneNumber() throws {
        let expectedResult = "(123) 456-7890"
        let contact = UserContact(id: 1, name: "John Doe", username: "jd", email: "fake@fake.com", phone: "123-456-7890")
        XCTAssertEqual(contact.formattedPhone, expectedResult)
    }
    
    func testInitialsForName() throws {
        let expectedResult = "JD"
        let contact = UserContact(id: 1, name: "John Doe", username: "jd", email: "fake@fake.org", phone: "8765309")
        XCTAssertEqual(contact.initials, expectedResult)
    }
    
    func testTwoDigitCountryCode() throws {
        let expectedResult = "+44 (123) 456-7890"
        let contact = UserContact(id: 1, name: "John Doe", username: "jd", email: "fake@fake.org", phone: "44-123-456-7890")
        XCTAssertEqual(contact.formattedPhone, expectedResult)
    }
}
