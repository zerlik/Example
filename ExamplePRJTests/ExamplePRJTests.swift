//
//  ExamplePRJTests.swift
//  ExamplePRJTests
//
//  Created by Andrei Ziamlianski on 12/01/2025.
//

import XCTest
@testable import ExamplePRJ

final class ExamplePRJTests: XCTestCase {

    var parser: XMLParser?
    var testData: [EmailMock] = []
    let recordKey = "test"
    let addressKey = "address"
    let categoryKey = "category"
    let innerKeys = Set<String>(["address", "category"])
    var currentDic: [String: String]?
    var currentValue: String?

    override func setUpWithError() throws {
        let path = Bundle.main.path(forResource: "email-stubs", ofType: "xml")
        parser = XMLParser(contentsOf: URL(fileURLWithPath: path!))
        parser?.delegate = self
        if parser!.parse() {
            print("parsed")

        } else {
            print("error")
        }
    }

    override func tearDownWithError() throws {

    }

    func testValidEmails() throws {
        for td in testData.filter({ $0.category == .validEmail}) {
            XCTAssert(AuthValidation.emailIsValid(td.value), td.value)
        }
    }

    func testInvalidEmail() throws {
        for td in testData.filter({ $0.category == .invalidEMail }) {
            XCTAssert(!AuthValidation.emailIsValid(td.value), td.value)
        }
    }

    func testValidPassword() throws {
        XCTAssert(AuthValidation.passwordIsValid("214gr"))
    }

    func testInvalidEPassword() throws {
        XCTAssert(!AuthValidation.passwordIsValid(""))
    }

    
}

extension ExamplePRJTests: XMLParserDelegate {
    func parserDidStartDocument(_ parser: XMLParser) {
        testData = []
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if elementName == recordKey {
            currentDic = [:]
        } else if innerKeys.contains(elementName) {
            currentValue = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        currentValue? += string

    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == recordKey {
            if let category = EmailMockCategory(rawValue: currentDic![categoryKey]!) {
                let address = currentDic![addressKey]
                testData.append(EmailMock(value: address!, category: category))
            }
            currentDic = nil
        } else if innerKeys.contains(elementName) {
            currentDic![elementName] = currentValue
            currentValue = nil
        }
    }
}

struct EmailMock {
    var value: String
    var category: EmailMockCategory
}

enum EmailMockCategory: String {
    case validEmail = "ISEMAIL_VALID_CATEGORY"
    case invalidEMail = "ISEMAIL_ERR"
}
