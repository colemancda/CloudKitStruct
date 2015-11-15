//
//  Encode.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/13/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import CloudKit

/// Specifies how a type can be encoded to be stored with CloudKit.
public protocol CloudKitEncodable {
    
    func toRecord() -> CKRecord
}

public extension CollectionType where Generator.Element: CloudKitEncodable {
    
    func toRecords() -> [CKRecord] {
        
        return self.map { (encodable) -> CKRecord in return encodable.toRecord() }
    }
}
