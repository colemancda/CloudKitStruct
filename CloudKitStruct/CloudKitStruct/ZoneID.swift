//
//  ZoneID.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/17/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CloudKit

/// CloudKit Record Zone ID
public struct RecordZoneID: CloudKitConvertible {
    
    public var zoneName: String
    
    public var ownerName: String
    
    public init(zoneName: String = CKRecordZoneDefaultName, ownerName: String = CKOwnerDefaultName) {
        
        self.zoneName = zoneName
        self.ownerName = ownerName
    }
}

// MARK: - CloudKit

public extension RecordZoneID {
    
    init(CloudKit recordZoneID: CKRecordZoneID) {
        
        self.zoneName = recordZoneID.zoneName
        self.ownerName = recordZoneID.ownerName
    }
    
    func toCloudKit() -> CKRecordZoneID {
        
        return CKRecordZoneID(zoneName: zoneName, ownerName: ownerName)
    }
}