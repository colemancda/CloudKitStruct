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
    
    /// Encdodes type to CloudKit record.
    func toCloudKit() -> CKRecord
}

public extension CollectionType where Generator.Element: CloudKitEncodable {
    
    /// Encodes collection to CloudKit records. 
    func toCloudKit() -> [CKRecord] {
        
        return self.map { (encodable) in return encodable.toCloudKit() }
    }
}
