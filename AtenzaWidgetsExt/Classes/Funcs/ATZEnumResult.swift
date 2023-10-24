//
//  ATZEnumResult.swift
//  AtenzaWidgetsExt
//
//  Created by NAS on 2023/10/24.
//

import Foundation
import UIKit

public typealias ATZValueBlock<Value> = (Value)->Void
public typealias ATZNullBlock = ()->Void

public enum ATZResult<Value0,Value1>{
    case success(Value0)
    case failure(Value1)
}

public enum ATZNullResult{
    case success
    case failure
}

public enum ATZValueResult<Value>{
    case success(Value)
    case failure(Value)
}

public enum ATZSuccessResult<Value>{
    case success(Value)
    case failure
}

public enum ATZErrorResult<Value>{
    case success
    case failure(Value)
}


