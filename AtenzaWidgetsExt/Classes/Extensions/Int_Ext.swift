//
//  Int_Ext.swift
//  AtenzaWidgetsExt
//
//  Created by NAS on 2023/10/24.
//

import Foundation
import UIKit

public extension Int{
    /// bytes转字符串大小
    func atz_storageFormat(unit: ByteCountFormatter.Units = .useAll, includesUnit: Bool = true)-> String{
        let format = ByteCountFormatter()
        format.allowedUnits = unit
        format.countStyle = .binary
        format.includesUnit = includesUnit
        return format.string(fromByteCount: .init(self))
    }
    
    /// 秒数转时长
    func atz_timeFormat()-> String{
        let second = self
        let h = second / 3600
        let m = second % 3600 / 60
        let s = second % 60
        let hStr = String(format: "%02d", h)
        let mStr = String(format: "%02d", m)
        let sStr = String(format: "%02d", s)
        if h > 0 { return "\(hStr):\(mStr):\(sStr)" }
        if m > 0 { return "\(mStr):\(sStr)" }
        return "0:\(sStr)"
    }
}
