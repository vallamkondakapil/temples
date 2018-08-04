//
//  Utils.swift
//  Hindu Temples
//
//  Created by Kapil Vallamkonda on 7/28/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    static func displayAlert(message: String, viewController: UIViewController, dismissBlock: ((UIAlertAction) -> ())? = nil) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: dismissBlock)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
