//
//  RealmDatabse.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 3.10.2024.
//

import Foundation
import RealmSwift

class RealmDatabase: LocalDatabaseProtocol{
    
    private let realm: Realm
    
    init(inMemoryIdentifier: String? = nil, objects: [Object.Type]? = nil) {
        
        let configuration = Realm.Configuration(inMemoryIdentifier: inMemoryIdentifier,
                                                deleteRealmIfMigrationNeeded: true,
                                                objectTypes: objects)
        
        guard let realm = try? Realm(configuration: configuration) else {
            fatalError("Realm could not be created")
        }
        self.realm = realm
    }
    
    func add<T>(model: T) where T : Object {
        try? realm.write({
            realm.add(model)
        })
    }
    
    func clearAll<T>(model: T.Type) where T : Object {
        try? realm.write({
            realm.deleteAll()
        })
    }
    
    func items<T>() -> [T] where T : Object {
        return realm.objects(T.self).map{ $0 }
    }
    
    func delete<T>(model: T) where T : Object {
        try? realm.write({
            realm.delete(model)
        })
    }
    
    func deleteFromId<T>(model: T.Type, id: String) where T : Object {
        guard let objectId = try? ObjectId(string: id) else{
            return
        }
        
        let item = realm.objects(model.self).filter("id == %@", objectId)
        
        try? realm.write({
            realm.delete(item)
        })
    }
    
    func listenChanges<T>(model: T.Type, result: @escaping (LocalDatabaseUpdate, [Int]) -> Void) where T : Object {
        
        let results = realm.objects(model.self)
        
        let token = results.observe { changes in
            switch changes{
            case .initial:
               break
            case .update(_, let deletions, let insertions , let modifications):
                
                if !deletions.isEmpty{
                    return result(.delete, deletions)
                }
                
                if !insertions.isEmpty{
                    return result(.insert, insertions)
                }
                
                if !modifications.isEmpty{
                    return result(.modify, modifications)
                }
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
}
