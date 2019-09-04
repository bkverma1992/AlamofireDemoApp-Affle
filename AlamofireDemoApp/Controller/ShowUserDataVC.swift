//
//  ShowUserDataVC.swift
//  AlamofireDemoApp
//
//  Created by Bhupinder on 5/9/19.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import UIKit
import RealmSwift

class ShowUserDataVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let realm = try? Realm()
    var employees:Results<employe>? = nil
    
    @IBOutlet weak var userTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        employees = self.realm!.objects(employe.self)

        let adddd = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapButton))
        self.navigationItem.rightBarButtonItem = adddd
    }
    
    @objc func tapButton()
    {
        print("ADDDD")
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AddEmployeeVC") as? AddEmployeeVC
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell//1.
        if let employee = employees?[indexPath.row] {
            cell.sNoLbl.text = "\(indexPath.row + 1)"
            cell.detailsLbl.text = employee.employeeName ?? ""
            cell.nameLbl.text = employee.employeeSalery ?? ""
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC

        if let employee = employees?[indexPath.row]
        {
            vc?.age = employee.employeeAge as Any as! NSString
            vc?.name = employee.employeeName as Any as! NSString
            vc?.id = employee.emplyeeId as Any as! NSString
            vc?.sal = employee.employeeSalery as Any as! NSString
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func back(_ sender: UIButton)
    {
        
    }
    
    static func getInfoById(id: String) -> employe {
        let realm = try! Realm()
        let scope = realm.objects(employe.self).filter("employeeName == %@", id)
        return scope.first!
    }

}
