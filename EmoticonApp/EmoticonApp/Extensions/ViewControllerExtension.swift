//
//  ViewControllerExtension.swift
//  EmoticonApp
//
//  Created by bean Milky on 2021/01/18.
//

import UIKit

extension UIViewController {

    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */

    var topbarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
}
