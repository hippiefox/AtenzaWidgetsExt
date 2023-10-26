//
//  ViewController.swift
//  AtenzaWidgetsExt
//
//  Created by HippieFox on 10/23/2023.
//  Copyright (c) 2023 HippieFox. All rights reserved.
//

import UIKit
import AtenzaWidgetsExt
class ViewController: ATZViewController {
    
    
    @ATZDefaults(key: "token", defaultValue: "")
    var token: String
    @ATZDefaults(key: "phone", defaultValue: "")
    var phone: String

    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.setTitle("go", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(tapGo), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.atz_navigationBar?.leftItem = customLeftNavigationItem(self, selector: #selector(actionBack))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    @objc private func tapGo(){
        token = "abc"
//        let vc = FooViewController()
//        present(vc, animated: true)
    }

}

