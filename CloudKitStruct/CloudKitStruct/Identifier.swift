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