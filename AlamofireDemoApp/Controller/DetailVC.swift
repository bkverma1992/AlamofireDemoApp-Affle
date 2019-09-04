//
//  DetailVC.swift
//  AlamofireDemoApp
//
//  Created by Yugasalabs-28 on 09/05/2019.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet var editVieww: UIView!
    
    var age = NSString()
    var name = NSString()
    var sal = NSString()
    var id = NSString()

    
    
    @IBOutlet var empID: UILabel!
    @IBOutlet var empName: UILabel!
    @IBOutlet var empAge: UILabel!
    @IBOutlet var empSalery: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        empAge.text=age as String
        empName.text=name as String
        empID.text=id as String
        empSalery.text=sal as String
        editVieww .isHidden = true

        let editBTN = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = editBTN
    }
    
    @objc func tapButton()
    {
        print("EDIT")
//        UIView.animate(withDuration: 0.3, animations: { ()->Void in
//           editVieww.view.frame=CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
//        }) { (finished) in
//            self.menuVC.view.removeFromSuperview()
//        }
    }
    
}
