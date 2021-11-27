//
//  ViewController.swift
//  HKPArrow
//
//  Created by huangkunpeng on 2021/11/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let v = HKPArrow(frame: CGRect(x: 20, y: 100, width: 200, height: 100))
        v.backgroundColor = .clear
        v.layer.shadowColor   = UIColor.black.cgColor
        v.layer.shadowOpacity = 0.12
        v.layer.shadowOffset  = CGSize(width: 0, height:0)
        v.layer.shadowRadius  = 2
        v.layer.cornerRadius  = 10
        self.view.addSubview(v)
    }


}

