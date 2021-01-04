//
//  ListTransform.swift
//  ObjectMapper+Realm
//
//  Created by Jake Peterson on 8/25/16.
//  Copyright © 2016 jakenberg. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

public struct ArrayTransform<T: AnyObject>: TransformType where T: BaseMappable {
    
    public init() { }
    
    public typealias Object = Array<T>
    public typealias JSON = Array<Any>
    
    public func transformFromJSON(_ value: Any?) -> Array<T>? {
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            var list = Array<T>()
            list.append(contentsOf: objects)
            return list
        }
        return nil
    }
    
    public func transformToJSON(_ value: Object?) -> JSON? {
        return value?.compactMap { $0.toJSON() }
    }
}

public struct ListTransform<T: RealmSwift.Object>: TransformType where T: BaseMappable {
    
    public init() { }
    
    public typealias Object = List<T>
    public typealias JSON = Array<Any>
    
    public func transformFromJSON(_ value: Any?) -> List<T>? {
        if let objects = Mapper<T>().mapArray(JSONObject: value) {
            let list = List<T>()
            list.append(objectsIn: objects)
            return list
        }
        return nil
    }
    
    public func transformToJSON(_ value: Object?) -> JSON? {
        return value?.compactMap { $0.toJSON() }
    }
}
