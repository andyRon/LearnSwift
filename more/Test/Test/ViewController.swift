//
//  ViewController.swift
//  Test
//
//  Created by andyron on 2017/3/17.
//  Copyright © 2017年 andyron. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire
import RandomKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let value = Int.random(using: &Xoroshiro.default)

        print(value)
    }

    func Kingfisher() {
        imageView.kf.setImage(with: URL(string: "https://www.baidu.com/img/bd_logo1.png"))
    }

    func RandomKit() {
        
    }

}

