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
import FileKit
import PathKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        RandomKit()
        let path = Path("/usr/bin/swift")
        print(path.isFile)
        
    }

    func Kingfisher() {
        imageView.kf.setImage(with: URL(string: "https://www.baidu.com/img/bd_logo1.png"))
    }

    func RandomKit() {
        print(Int.random(within: -100 ... 100, using: &Xorshift.default) )
    }

}

