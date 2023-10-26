//
//  FooViewController.swift
//  AtenzaWidgetsExt_Example
//
//  Created by pulei yu on 2023/10/25.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import AtenzaWidgetsExt

class FooViewController: UIViewController{
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("countDown", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tapGo), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.frame.size = .init(width: 200, height: 30)
        button.center = view.center
    }
    
    private var timers:DispatchSourceTimer?
    
    deinit{
        self.timers?.cancel()
        print("deinit",self.classForCoder.description())
    }
    
    @objc private func tapGo(){
        self.timers = button.atz_countDown(duration: 10) {[weak self] left in
            self?.button.setTitle("\(left)", for: .normal)
        }completion: { [weak self] in
            self?.button.setTitle("重新获取", for: .normal)
        }
    }

}
