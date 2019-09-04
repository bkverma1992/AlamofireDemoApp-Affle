//
//  AddEmployeeVC.swift
//  AlamofireDemoApp
//
//  Created by Yugasalabs-28 on 09/05/2019.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import UIKit
import RealmSwift

class AddEmployeeVC: UIViewController
{
    let realm = try? Realm()
    var employees:Results<employe>? = nil

    @IBOutlet var uerId: UITextField!
    
    @IBOutlet var userName: UITextField!
    
    @IBOutlet var userAge: UITextField!
    
    @IBOutlet var userSalery: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addData(_ sender: Any)
    {
        let addEmployee = employe()
        addEmployee.employeeAge = "26"
        addEmployee.employeeSalery = "20k"
        addEmployee.emplyeeId = "1000"
        addEmployee.employeeName = "bk"
        addEmployee.employeeImage = ""
        
        
        
        
        
        try! self.realm!.write
        {
//            if let users = self.realm?.add(addEmployee, update: true) {
//              //  self.realm!.(users)
//            }
            realm?.add(addEmployee, update: true)
        }
  
        try! self.realm!.write
        {
            if let users = self.realm?.objects(employe.self)
            {
                print(users)            }
        
    }
}
}
