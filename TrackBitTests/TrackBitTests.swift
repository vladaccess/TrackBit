//
//  TrackBitTests.swift
//  TrackBitTests
//
//  Created by Vladislav on 07.08.2018.
//  Copyright © 2018 Vladislav. All rights reserved.
//

import XCTest
@testable import TrackBit





class TrackBitTests: XCTestCase {
    
    var db:dbManager!
    
    
    override func setUp() {
        super.setUp()
        db = dbManager()
    }
    
    override func tearDown() {
        super.tearDown()
        db.removeAll()
    }
    
    func testInsertObject() {
        db.insert(data: Data(), date: Date())
        let objectCount = db.fetch()!.count
        XCTAssertEqual(objectCount, 1)
    }
    
    func testRemoveAll() {
        db.insert(data: Data(), date: Date())
        db.insert(data: Data(), date: Date())
        db.insert(data: Data(), date: Date())
        db.removeAll()
        let objectsCount = db.fetch()!.count
        XCTAssertEqual(objectsCount, 0)
    }
    
    func testInsertSignificantObject() {
        db.insert(data: Data(), date: Date(), referenceType: ReferenceType.year.rawValue)
        db.insert(data: Data(), date: Date(), referenceType: ReferenceType.month.rawValue)
        let yearObjects = db.fetch(byReference: ReferenceType.year.rawValue)
        let monthObjects = db.fetch(byReference: ReferenceType.month.rawValue)
        XCTAssertEqual(yearObjects!.referenceType, ReferenceType.year.rawValue)
        XCTAssertEqual(monthObjects!.referenceType, ReferenceType.month.rawValue)
    }
    
}
