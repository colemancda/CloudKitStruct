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
public struct RecordZoneID {
    
    public var name: String
    
    public var owner: String
    
    public init(name: String = CKRecordZoneDefaultName, owner: String = CKOwnerDefaultName) {
        
        self.name = name
        self.owner = owner
    }
}

// MARK: - CloudKit

public extension RecordZoneID {
    
    init(CloudKit: CKRecordZoneID) {
        
        self.name = recordZoneID.zoneName
        self.owner = recordZoneID.ownerName
    }
    
    func toCloudKit() -> 
}