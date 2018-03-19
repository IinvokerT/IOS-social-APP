//
//  InvtationCodeVC.swift
//  Unime
//
//  Created by 刘研飞 on 2018/3/14.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class InvtationCodeVC: UIViewController, InvitationCodeViewDelegate {
    
    ///返回首页
    @IBAction func touch_backButton(_ sender: UIButton) {
        self.view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touch_howGetCode(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "提示", message: "邀请码由朋友分享获得", preferredStyle: .alert)
        let ok = UIAlertAction(title: "知道了", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    ///提示用户信息
    var showLabel = UILabel(frame: CGRect(x: 0, y: 300, width: UIScreen.main.bounds.width, height: 30))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let codeView = InvitationCodeView(frame: CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 100), numberOfRect: 4, margin: 10)
        view.backgroundColor = UIColor.white
        codeView.delegate = self
        view.addSubview(codeView)
        
        showLabel.text = "请输入邀请码"
        showLabel.textAlignment = .center
        showLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(showLabel)
    }
    
    //实现InvitationCodeViewDelegate中的方法
    func invitationCodeInputDidfinished(invitationCodeView: InvitationCodeView, invitationCode: String) {
        //向服务验证邀请码的正确与否，根据结果继续
        if invitationCode != "6666" {
            invitationCodeView.cleanCode()
            showLabel.text = "邀请码有误，请重新输入"
            showLabel.font = UIFont.boldSystemFont(ofSize: 25)
        }else {
            self.performSegue(withIdentifier: "showSignUp", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
