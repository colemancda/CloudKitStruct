//
//  Decode.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/13/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import CloudKit

/// Specifies how a type can be decoded from CloudKit.
public protocol CloudKitDecodable {
    
    typealias CloudKitType
    
    /// Decodes the type from ```CloudKit``` values. 
    ///
    /// Assumes the record was fetched with all of its keys.
    init?(CloudKit: CloudKitType)
}

public extension CloudKitDecodable {
    
    static func fromCloudKit(values: [CloudKitType]) -> [Self]? {
        
        var decodables = [Self]()
        
        for value in values {
            
            guard let decodable = self.init(CloudKit: value) else { return nil }
            
            decodables.append(decodable)
        }
        
        return decodables
    }
}