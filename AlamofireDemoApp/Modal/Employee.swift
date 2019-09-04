//
//  Employee.swift
//  AlamofireDemoApp
//
//  Created by Bhupinder on 5/9/19.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import RealmSwift
import Realm

class employe: Object, Mappable
{
    @objc dynamic var emplyeeId: String?
    @objc dynamic var employeeName: String?
    @objc dynamic var employeeAge: String?
    @objc dynamic var employeeSalery: String?
    @objc dynamic var employeeImage: String?
    
    required init?(map: Map)
    {
        super.init()
        mapping(map: map)
    }
    
    override required init()
    {
        super.init()
    }
    
    override required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        //fatalError("init(realm:schema:) has not been implemented")
    }
    
    override required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
        //fatalError("init(value:schema:) has not been implemented")
    }
    
     func mapping(map: Map)
    {
        employeeName <- map["employee_name"]
        emplyeeId <- map["id"]
        employeeAge <- map["employee_age"]
        employeeSalery <- map["employee_salary"]
        employeeImage <- map["profile_image"]
    }
    
   
}
