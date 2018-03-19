//
//  InvitationCodeView.swift
//  Unime
//
//  Created by 刘研飞 on 2018/3/14.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit


protocol InvitationCodeViewDelegate {
    ///用户输入完成后所需要的逻辑操作
    func invitationCodeInputDidfinished(invitationCodeView:InvitationCodeView, invitationCode:String)
    
}

class InvitationCodeView: UIView, UITextFieldDelegate, InvitationCodeTextFieldDeleteDelegate {
    
    var delegate: InvitationCodeViewDelegate?
    
    ///邀请码位数
    var numberOfRect = 4
    
    ///每个数字的长宽
    let width: CGFloat = 50
    
    ///数字之间的间隔
    var margin: CGFloat = 10
    
    ///所有邀请码位数输入框的集合
    var textFieldArray = [UITextField]()
    
    init(frame: CGRect, numberOfRect:Int = 4, margin:CGFloat = 10) {
        super.init(frame: frame)
        self.numberOfRect = numberOfRect
        self.margin = margin
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    ///清空邀请码
    func cleanCode() {
        for textView in textFieldArray {
            textView.text = ""
        }
        textFieldArray.first?.becomeFirstResponder()
    }
    
    ///加载邀请码输入框
    func setupUI() {
        self.isUserInteractionEnabled = false
        let leftMargin = (UIScreen.main.bounds.width - CGFloat(numberOfRect) * width - CGFloat(numberOfRect - 1) * margin)/2
        for i in 0..<numberOfRect {
            let rect = CGRect(x: leftMargin + CGFloat(i) * (width + margin), y: 10, width: width, height: width)
            let textField = self.createTextField(frame: rect)
            textField.tag = i
            textFieldArray.append(textField)
        }
        textFieldArray.first?.becomeFirstResponder()
    }
    
    ///创建邀请码输入框
    private func createTextField(frame:CGRect) ->UITextField {
        let textField = InvitationCodeTextField(frame:frame)
        textField.borderStyle = .line
        textField.textAlignment = .center
        textField.font = UIFont.boldSystemFont(ofSize: 40)
        textField.textColor = UIColor.init(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        textField.delegate = self
        textField.deleteDelegate = self
        addSubview(textField)
        textField.keyboardType = .numberPad
        return textField
    }
    
    //实现UITextFieldDelegate中的方法
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.hasText {
            return false
        }
        let index = textField.tag
        textField.resignFirstResponder()
        //已经是最后一个输入框
        if index == numberOfRect - 1 {
            textFieldArray[index].text = string
            //开始拼接邀请码
            var code: String = ""
            for tf in textFieldArray {
                code += tf.text ?? ""
            }
            //代理执行邀请码输入完毕后的操作
            delegate?.invitationCodeInputDidfinished(invitationCodeView: self, invitationCode: code)
            return false
        }
        textFieldArray[index].text = string
        textFieldArray[index+1].becomeFirstResponder()
        return false
    }
    
    //实现InvitationCodeTextFieldDeleteDelegate协议中的方法，监听删除操作
    func didClickDelete() {
        for i in 1..<numberOfRect{
            
            if !textFieldArray[i].isFirstResponder {
                continue
            }
            textFieldArray[i].resignFirstResponder()
            textFieldArray[i-1].becomeFirstResponder()
            textFieldArray[i-1].text = ""
            
        }
    }

}
