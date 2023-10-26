//
//  Window_Ext.swift
//  AtenzaWidgetsExt
//
//  Created by pulei yu on 2023/10/25.
//

import Foundation
import UIKit

public extension UIWindow {
    static func atz_keyWindow() -> UIWindow? {
        if #available(iOS 13, *) {
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
               let window = scene.windows.first(where: { $0.isKeyWindow }) {
                return window
            }
        }
        return UIApplication.shared.delegate?.window ?? nil
    }

    static func atz_visibleViewController() -> UIViewController? {
        guard let win = atz_keyWindow(),
              let root = win.rootViewController
        else { return nil }

        return atz_viewController(from: root)
    }

    static func atz_viewController(from controller: UIViewController) -> UIViewController {
        if let nav = controller as? UINavigationController,
           let topVC = nav.viewControllers.last {
            return atz_viewController(from: topVC)
        }

        if let tab = controller as? UITabBarController,
           let selected = tab.selectedViewController {
            return atz_viewController(from: selected)
        }

        if let presentedVC = controller.presentedViewController {
            return atz_viewController(from: presentedVC)
        }

        return controller
    }
}
