//
//  StringExtensionsTests.swift
//  StringExtensionsTests
//
//  Created by Alex Stein on 6/18/16.
//  Copyright © 2016 Alexander Stein. All rights reserved.
//

import XCTest
@testable import StringExtensions

class StringExtensionsTests: XCTestCase {
    
    let alphabetString = "abcdefghijklmnopqrstuvwxyz"
    let lorumIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_subscriptIntSubstring_onAlphabet_cdef(){
        let expectedResult = "cdef"
        let actualResult = alphabetString[2,4]
        
        XCTAssert(expectedResult == actualResult)
    }
    
    func test_subscriptIntRangeSubstring_onAlphabet_indexOutOfBounds_Nil(){
        XCTAssertNil(alphabetString[10,100])
    }
    
    func test_hasMatch_onAlphabet_true() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let expectedResult = true
        var actualResult : Bool!
        let pattern = "cde"
        
        actualResult = alphabetString.hasMatch(pattern)
        
        XCTAssert(expectedResult == actualResult)
    }
    
    func test_hasMatch_onAlphabet_false() {
        
        let expectedResult = false
        var actualResult : Bool!
        let pattern = "cdde"
        
        actualResult = alphabetString.hasMatch(pattern)
        
        XCTAssert(expectedResult == actualResult)
    }
    
    func test_matches_onLorumIpsum_2(){
        let expectedResult = 2
        var actualResult : Int!
        let pattern = "it"
        
        let matches = lorumIpsum.matches(withPattern: pattern)!
        actualResult = matches.count
        
        XCTAssert(expectedResult == actualResult)
    }
    
    func test_matchFirst_onLorumIpsum_it(){
        let expectedResult = "ip"
        var actualResult : String!
        let pattern = "i[pts]"
        
        actualResult = lorumIpsum.matchFirst(pattern)
        
        XCTAssert(expectedResult == actualResult)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            self.test_matches_onLorumIpsum_2()
        }

    }
}
