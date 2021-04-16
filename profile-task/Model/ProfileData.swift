//
//  ProfileData.swift
//  profile-task
//
//  Created by surendra on 14/04/21.
//

import Foundation
//MARK:- Struct Models
struct ProfileData: Codable{
    var login: [Login]
    var MyDefault: [MyDefault]
    var MyAccount:[MyAccount]
    var Settings:[Settings]
    var AboutUs:[AboutUs]
}
struct Login: Codable{
    
    var title: String
   
}
struct MyDefault: Codable{
    
    var title: String
    
}
struct MyAccount: Codable{
    
    var title: String
    
}
struct Settings: Codable {
    var title: String
    
}
struct AboutUs: Codable {
    var title: String
    
}


