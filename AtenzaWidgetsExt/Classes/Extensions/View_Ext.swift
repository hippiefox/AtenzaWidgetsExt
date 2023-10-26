//
//  View_Ext.swift
//  AtenzaWidgetsExt
//
//  Created by pulei yu on 2023/10/25.
//

import Foundation
import UIKit
 
public extension UIView{
    static var reusedId: String{
        self.classForCoder().description()
    }
}
