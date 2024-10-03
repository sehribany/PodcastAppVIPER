//
//  RealmDatabaseTests.swift
//  PodcastAppTests
//
//  Created by Şehriban Yıldırım on 3.10.2024.
//

import XCTest
import RealmSwift
@testable import PodcastApp

internal class TestObject : Object{
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    
    var idValue: String{
        return id.stringValue
    }
}

final class RealmDatabaseTests: XCTestCase {
    var realmDatabase : RealmDatabase!
    
    override func setUp() {
        super.setUp()
        realmDatabase = RealmDatabase(inMemoryIdentifier: "TestableRealm",
                                      objects: [TestObject.self])
    }
    
    func testAddItem(){
        let testObject = TestObject()
        testObject.name = "Seboli"
        realmDatabase.add(model: testObject)
        
        let items = realmDatabase.items() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "vb")
    }
    
    func testClearAll(){
        let testObject = TestObject()
        testObject.name = "Seboli"
        realmDatabase.add(model: testObject)
        
        var items = realmDatabase.items<TestObject>() as [TestObject]
        
        XCTAssertEqual(items.count, 1)
        XCTAssertEqual(items.first?.name, "vb")
        
        realmDatabase.clearAll(model: TestObject.self)
        items = realmDatabase.items() as [TestObject]
        XCTAssertEqual(items.count, 0)
    }
}
