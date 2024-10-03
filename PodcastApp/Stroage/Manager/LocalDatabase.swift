//
//  LocalDatabase.swift
//  PodcastApp
//
//  Created by Şehriban Yıldırım on 3.10.2024.
//

import RealmSwift

protocol LocalDatabaseProtocol{
    func add<T: Object>(model: T)
    func clearAll<T: Object>(model: T.Type)
    func items<T: Object>() -> [T]
    func delete<T: Object>(model: T)
    func deleteFromId<T: Object>(model: T.Type, id: String)
    func listenChanges<T: Object>(model: T.Type, result: @escaping(LocalDatabaseUpdate, [Int]) -> Void)
}

enum LocalDatabaseUpdate{
    case delete
    case insert
    case modify
}
