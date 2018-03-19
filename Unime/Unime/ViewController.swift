//
//  ViewController.swift
//  Unime
//
//  Created by 刘研飞 on 2018/3/13.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //实现判断登录与否的app初始显示界面
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let sb = UIStoryboard(name: "SignInAndSignUp", bundle: Bundle.main)
        let vc = sb.instantiateInitialViewController()
        let app = UIApplication.shared
        if let kw = app.keyWindow {
            kw.rootViewController = vc
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

