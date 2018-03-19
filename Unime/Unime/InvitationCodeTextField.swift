//
//  InvitationCodeTextField.swift
//  Unime
//
//  Created by 刘研飞 on 2018/3/14.
//  Copyright © 2018年 刘研飞. All rights reserved.
//

import UIKit

protocol InvitationCodeTextFieldDeleteDelegate {
    ///用户删除一位邀请码所要做的事
    func didClickDelete()
}

class InvitationCodeTextField: UITextField {
    
    var deleteDelegate: InvitationCodeTextFieldDeleteDelegate?
    
    override func deleteBackward() {
        super.deleteBackward()
        deleteDelegate?.didClickDelete()
    }

}
