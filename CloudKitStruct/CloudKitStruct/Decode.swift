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
    
    /// Decodes the type from ```CloudKit``` values. Assumes the record was fetched with all of its keys.
    init?(recordID: CKRecordID, values: [String: CKRecordValue])
}

public extension CloudKitDecodable {
    
    static func fromCloudKit(valuesByRecordID: [CKRecordID: [String: CKRecordValue]]) -> [Self]? {
        
        var decodables = [Self]()
        
        for (recordID, values) in valuesByRecordID {
            
            guard let decodable = self.init(recordID: recordID, values: values) else { return nil }
            
            decodables.append(decodable)
        }
        
        return decodables
    }
}