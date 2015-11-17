//
//  RecordID.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/17/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CloudKit

/// CloudKit Record ID
public struct RecordID: CloudKitConvertible {
    
    public var recordName: String
    
    public var zoneID: RecordZoneID
    
    public init(recordName: String, zoneID: RecordZoneID = RecordZoneID()) {
        
        self.recordName = recordName
        self.zoneID = zoneID
    }
}

// MARK: - CloudKit

public extension RecordID {
    
    init(CloudKit recordID: CKRecordID) {
        
        self.recordName = recordID.recordName
        self.zoneID = RecordZoneID(CloudKit: recordID.zoneID)
    }
    
    func toCloudKit() -> CKRecordID {
        
        return CKRecordID(recordName: recordName, zoneID: zoneID.toCloudKit())
    }
}
