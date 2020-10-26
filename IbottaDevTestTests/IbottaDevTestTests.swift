//
//  IbottaDevTestTests.swift
//  IbottaDevTestTests
//
//  Created by Muhammad Luqman on 10/25/20.
//

import XCTest
@testable import IbottaDevTest

class IbottaDevTestTests: XCTestCase {
    
    var productViewController = ProductViewController()
    
    func testNameIsNil(){
        
        if let localData = productViewController.serviceManager.readLocalFile(forName: "Offers") {
            productViewController.offers = productViewController.serviceManager.parse(jsonData: localData) ?? []
        }
        
        let result = productViewController.offers.filter { return ($0.name == nil) }
        XCTAssertEqual(result.count, 0)
        
    }
    
    func testPrise() {
        
        if let localData = productViewController.serviceManager.readLocalFile(forName: "Offers") {
            productViewController.offers = productViewController.serviceManager.parse(jsonData: localData) ?? []
        }
        
        let filtered = productViewController.offers.filter { offer in
            var currentValue: String = offer.currentValue
            currentValue.remove(at: currentValue.startIndex)
            let array = currentValue.components(separatedBy: " ")
            guard let newValue: Float = Float(array.first ?? "0") else{
                return false
            }
            return newValue <= 0 ? true : false
        }
        
        XCTAssertEqual(filtered.count, 0)
    }
    
    func testURLIsNil(){
        
        if let localData = productViewController.serviceManager.readLocalFile(forName: "Offers") {
            productViewController.offers = productViewController.serviceManager.parse(jsonData: localData) ?? []
        }
        
        let result = productViewController.offers.filter { return ($0.url == nil) }
        XCTAssertEqual(result.count, 0)
        
    }
    
}
