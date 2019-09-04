//
//  ViewController.swift
//  AlamofireDemoApp
//
//  Created by Bhupinder on 5/9/19.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireSwiftyJSON
import SwiftyJSON
import ObjectMapper
import Realm
import RealmSwift


class ViewController: UIViewController
{
    var str: String = String()
    var jsonDictionary : [String : Any] = Dictionary()
    
    let realm = try? Realm()
    var employees:Results<employe>? = nil


   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
    }


    @IBAction func startBTN(_ sender: Any)
    {
      self.addService()
    }
    
    
    func addService()
    {
        Alamofire.request("http://dummy.restapiexample.com/api/v1/employees").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil)
            {
                let jsonDictionary = responseData.result.value
                
                guard let empArray = jsonDictionary as? [[String: Any]] else {
                    print("unable to convert")
                    return
                }
                
                // save data in realam
                let employeedata = Mapper<employe>().mapArray(JSONArray: empArray)
            
                try! self.realm!.write
                {
                    if let users = self.realm?.objects(employe.self) {
                        self.realm!.delete(users)
                    }
                }
                try! self.realm!.write
                {
                    self.realm!.add(employeedata)
                }
               
                let users = self.realm!.objects(employe.self)
                print(users)
                
                let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowUserDataVC") as? ShowUserDataVC
                self.navigationController?.pushViewController(vc!, animated: true)

        }
    }
  }
}

