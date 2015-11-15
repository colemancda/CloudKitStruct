//
//  CloudKitExtensions.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/15/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import CloudKit

extension CKRecord: CloudKitEncodable {
    
    public func toCloudKitValues() -> [String : CKRecordValue] {
        
        var values = [String : CKRecordValue]()
        
        for key in allKeys() {
            
            values[key] = self[key]
        }
        
        return values
    }
}
