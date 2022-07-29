//
//  CoreDataStorage.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/29.
//

import CoreData

protocol CoreDataStorage {
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T]
    func insertImageinfo(imageInfo: ImageInfo) -> Bool
    func delete(object: NSManagedObject) -> Bool
}
