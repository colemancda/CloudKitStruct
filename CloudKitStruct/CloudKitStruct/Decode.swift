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
    
    /// Decodes the type from a ```CloudKit``` record. Assumes the record was fetched with all of its keys.
    init?(record: CKRecord)
}

public extension CloudKitDecodable {
    
    static func fromCloudKit(records: [CKRecord]) -> [Self]? {
        
        var decodables = [Self]()
        
        for record in records {
            
            guard let decodable = self.init(record: record) else { return nil }
            
            decodables.append(decodable)
        }
        
        return decodables
    }
}