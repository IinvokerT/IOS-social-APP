//
//  SignUpVC.swift
//  Unime
//
//  Created by 刘研飞 on 2018/3/15.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var verificationCodeBtn: UIButton!
    
    @IBAction func touch_varificationCodeBtn(_ sender: UIButton) {
        isCounting = true
        
    }
    @IBAction func touch_cancelBtn(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    ///剩余时间
    var remainingSeconds: Int = 0 {
        willSet {
            verificationCodeBtn.setTitle("重新获取(\(newValue)秒)", for: .normal)
            if newValue <= 0 {
                verificationCodeBtn.setTitle("点击获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    var countDownTimer: Timer?
    
    ///开启关闭倒计时标志
    var isCounting = false {
        willSet {
            if newValue {
                countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
                remainingSeconds = 60
                verificationCodeBtn.backgroundColor = UIColor.gray
            }else {
                countDownTimer?.invalidate()
                countDownTimer = nil
                verificationCodeBtn.backgroundColor = UIColor.green
            }
            verificationCodeBtn.isEnabled = !newValue
        }
    }
    
    @objc func updateTime() {
        remainingSeconds -= 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
