//
//  CoreDataStorage.swift
//  Picterest
//
//  Created by 장주명 on 2022/07/28.
//

import CoreData

final class ImageDataCoreDataStorage: CoreDataStorage{
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ImageData")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                assertionFailure("CoreDataStorage Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func fetch<T: NSManagedObject>(request: NSFetchRequest<T>) -> [T] {
        do {
            let fetchResult = try self.context.fetch(request)
            return fetchResult
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    func insertImageinfo(imageInfo: ImageInfo) -> Bool {
        let entity = NSEntityDescription.entity(forEntityName: "ImageData", in: self.context)
        if let entity = entity {
            let managedObject = NSManagedObject(entity: entity, insertInto: self.context)
            managedObject.setValue(imageInfo.id, forKey: "id")
            managedObject.setValue(imageInfo.memo, forKey: "memo")
            managedObject.setValue(imageInfo.orginUrl, forKey: "orginUrl")
            managedObject.setValue(imageInfo.locationUrl, forKey: "locationUrl")
            managedObject.setValue(imageInfo.ratio, forKey: "ratio")
            do {
                try self.context.save()
                return true
            } catch {
                assertionFailure("CoreDataStorage Unresolved error \(error), \((error as NSError).userInfo)")
                return false
            }
        } else {
            return false
        }
    }
    
    func delete(object: NSManagedObject) -> Bool {
        self.context.delete(object)
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
}
