//
//  Convertible.swift
//  CloudKitStruct
//
//  Created by Alsey Coleman Miller on 11/17/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CloudKit

/// Type can be tranformed to a CloudKit type. No failiable decoding.
public protocol CloudKitConvertible {
    
    /// CloudKit type this type can convert to / from. 
    typealias CloudKitType: AnyObject
    
    /// Convert to CloudKit type.
    func toCloudKit() -> CloudKitType
    
    /// Initialize from CloudKit type.
    init(CloudKit: CloudKitType)
}