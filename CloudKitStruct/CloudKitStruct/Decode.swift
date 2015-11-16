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
    
    /// Decodes the type from ```CloudKit``` values. 
    ///
    /// Assumes the record was fetched with all of its keys.
    init?(recordName: String, values: [String: CKRecordValue])
}

public extension CloudKitDecodable {
    
    static func fromCloudKit(valuesByRecordName: [(String, [String: CKRecordValue])]) -> [Self]? {
        
        var decodables = [Self]()
        
        for (recordName, values) in valuesByRecordName {
            
            guard let decodable = self.init(recordName: recordName, values: values) else { return nil }
            
            decodables.append(decodable)
        }
        
        return decodables
    }
}