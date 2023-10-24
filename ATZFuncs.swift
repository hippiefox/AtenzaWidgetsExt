//
//  ATZFuncs.swift
//  AtenzaWidgetsExt
//
//  Created by NAS on 2023/10/24.
//

import Foundation


public func MTLog(_ items: Any...,
                  separator: String = " ",
                  terminator: String = "\n")
{
    guard AtenzaConfig.isLogable else { return }
    print("\n\((#file as NSString).lastPathComponent) [\(#line)] \(#function)")
    print(items, separator: separator, terminator: terminator)
}
