//
//  ATZSize.swift
//  AtenzaWidgetsExt
//
//  Created by pulei yu on 2023/10/24.
//

import Foundation
import UIKit

public let ATZ_SCREEN_WIDTH = UIScreen.main.bounds.width
public let ATZ_SCREEN_HEIGHT = UIScreen.main.bounds.height
public var ATZ_SCREEN_MIN_SIZE: CGFloat { min(ATZ_SCREEN_WIDTH, ATZ_SCREEN_HEIGHT) }
public var ATZ_SCREEN_MAX_SIZE: CGFloat { max(ATZ_SCREEN_WIDTH, ATZ_SCREEN_HEIGHT) }

public func ATZ_Baseline(_ a: CGFloat) -> CGFloat {
    a * (ATZ_SCREEN_WIDTH / 375)
}

public var ATZ_SafeAreaInsets: UIEdgeInsets {
    if #available(iOS 13, *) {
        let scene = UIApplication.shared.connectedScenes.first { $0.activationState == .foregroundActive }
        if let winScene = scene as? UIWindowScene,
           let window = winScene.windows.first {
            return window.safeAreaInsets
        } else {
            return .zero
        }
    } else {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    }
}

public let ATZ_NAV_HEIGHT_NOTX: CGFloat = 64
public let ATZ_NAV_HEIGHT: CGFloat = ATZ_SafeAreaInsets.top > 0 ? ATZ_SafeAreaInsets.top + 44 : ATZ_NAV_HEIGHT_NOTX
