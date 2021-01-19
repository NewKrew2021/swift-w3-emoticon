//
//  UIViewController+.swift
//  EmoticonApp
//
//  Created by 지현우 on 2021/01/19.
//

import UIKit

extension UIViewController {
    func showAlert(style: UIAlertController.Style, title: String, message: String?, confirm: String?, cancel: String = "취소", destructive: String?, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        if confirm != nil {
            let confirmAction = UIAlertAction(title: confirm, style:
                .default) { [weak self] _ in
                guard let self = self else { return }
                completion()
                self.showToast(vc: self, msg: "구매되었습니다.", sec: 0.5)
            }
            alert.addAction(confirmAction)
        }
        
        if destructive != nil {
            let destructiveAction = UIAlertAction(title: destructive, style: .destructive) { [weak self] _ in
                guard let self = self else { return }
                completion()
                self.showToast(vc: self, msg: "삭제되었습니다.", sec: 0.5)
            }
            alert.addAction(destructiveAction)
        }
        
        let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showToast(vc: UIViewController, msg: String, sec: Double) {
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
            
        vc.present(alert, animated: true, completion: nil)
            
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + sec) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
