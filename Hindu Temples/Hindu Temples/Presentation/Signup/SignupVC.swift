//
//  SignupVC.swift
//  Hindu Temples
//
//  Created by kapil vallamkonda on 7/20/18.
//  Copyright © 2018 kapil vallamkonda. All rights reserved.
//

import Foundation
import UIKit

class SignupVC: BaseViewController {
    @IBOutlet weak var stackView: UIStackView?
    
    @IBOutlet weak var scrollView: UIScrollView!
    var presenter: SignupPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SignupPresenter(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.setupUI()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func cancelClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
