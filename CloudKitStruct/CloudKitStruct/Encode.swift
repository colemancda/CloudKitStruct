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
    
    typealias CloudKitType
    
    func toCloudKit() -> CloudKitType
}

public extension CollectionType where Generator.Element: CloudKitEncodable {
    
    func toCloudKit() -> Generator.ElementCloudKitType {
        
        return self.map { (encodable) in return encodable.toCloudKit() }
    }
}
