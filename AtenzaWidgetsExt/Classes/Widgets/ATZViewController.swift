//
//  ATZViewController.swift
//  AtenzaWidgetsExt
//
//  Created by pulei yu on 2023/10/26.
//

import Foundation
import UIKit

open class ATZViewController: UIViewController {
    open var atz_navigationBar: ATZNavigationBar?

    open lazy var naviBackButton: UIButton = {
        let button = UIButton()
        button.frame.size = .init(width: 40, height: 40)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.addTarget(self, action: #selector(actionBack), for: .touchUpInside)
        return button
    }()

    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        initNavigationBar()
    }

    open func customLeftNavigationItem(_ target: Any?, selector: Selector) -> ATZBarButtonItem? {
        var leftItem: ATZBarButtonItem?
        if navigationController != nil {
            leftItem = ATZBarButtonItem(customView: naviBackButton)
        }
        return leftItem
    }

    @objc open func actionBack() {
        navigationController?.popViewController(animated: true)
    }

    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let atz_navigationBar = atz_navigationBar {
            atz_navigationBar.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: ATZ_NAV_HEIGHT)
            view.bringSubview(toFront: atz_navigationBar)
        }
    }

    private func initNavigationBar() {
        if let navigationController = navigationController {
            atz_navigationBar = ATZNavigationBar()
            atz_navigationBar?.weakController = self
            view.addSubview(atz_navigationBar!)
            if navigationController.viewControllers.count > 1 {
                atz_navigationBar?.leftItem = customLeftNavigationItem(self, selector: #selector(actionBack))
            }
        }
    }

    deinit {
        MTLog("------>deinit", self.classForCoder.description())
    }
}
