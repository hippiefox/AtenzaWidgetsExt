//
//  Button_Ext.swift
//  AtenzaWidgetsExt
//
//  Created by pulei yu on 2023/10/25.
//

import Foundation
import UIKit

public extension UIButton {
    @discardableResult
    func atz_countDown(duration: Int = 60,
                         isAutoEnable: Bool = true,
                         countingBlock: ((Int) -> Void)? = nil,
                         completion: (() -> Void)? = nil) -> DispatchSourceTimer {
        if isAutoEnable {
            isEnabled = false
        }

        let timeAtStart = Date().timeIntervalSince1970
        let ts = DispatchSource.makeTimerSource(flags: .init(rawValue: 0),
                                                queue: DispatchQueue.global())
        ts.schedule(deadline: .now(), repeating: .milliseconds(1000))
        ts.setEventHandler {
            DispatchQueue.main.async {
                let timeNow = Date().timeIntervalSince1970
                let leftTime = duration - Int(timeNow - timeAtStart)
                if leftTime < 0 {
                    ts.cancel()
                    if isAutoEnable {
                        self.isEnabled = true
                    }
                    completion?()
                } else {
                    countingBlock?(leftTime)
                }
            }
        }
        ts.activate()
        return ts
    }
}
