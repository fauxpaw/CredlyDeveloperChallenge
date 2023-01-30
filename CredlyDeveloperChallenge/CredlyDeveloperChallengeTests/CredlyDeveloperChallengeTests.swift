//
//  CredlyDeveloperChallengeTests.swift
//  CredlyDeveloperChallengeTests
//
//  Created by Michael Sweeney on 1/26/23.
//

import XCTest
@testable import CredlyDeveloperChallenge

final class CredlyDeveloperChallengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFullNameFormated_identity() throws {
        let expectedResult = "Leanne Graham"
        let contact = UserContact(id: 1, name: "Leanne Graham", username: "leagram", email: "fake@fake.com", phone: "8675309")
        XCTAssertEqual(contact.formattedName, expectedResult)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
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

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
