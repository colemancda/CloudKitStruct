//
//  Identifier.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/15/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CloudKit

public protocol CloudKitIdentifier {
    
    init(recordID: CKRecordID)
    
    func toRecordID() -> CKRecordID
}

// MARK: - Collection Extensions

public extension CollectionType where Generator.Element: CloudKitIdentifier {
    
    func toRecordIDs() -> [CKRecordID] {
        
        return self.map { (encodable) -> CKRecordID in return encodable.toRecordID() }
    }
}

public extension CloudKitIdentifier {
    
    static func fromCloudKit(records: [CKRecordID]) -> [Self]? {
        
        return records.map { (recordID) in return self.init(recordID: recordID) }
    }
}

// MARK: - String Protocol Extension

// Makes String a CloudKitIdentifier. Uses default zone.

extension String: CloudKitIdentifier {
    
    public init(recordID: CKRecordID) {
        
        self = recordID.recordName
    }
    
    public func toRecordID() -> CKRecordID {
        
        return CKRecordID(recordName: self)
    }
}