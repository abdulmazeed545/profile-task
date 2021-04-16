//
//  LocalServiceData.swift
//  profile-task
//
//  Created by surendra on 14/04/21.
//

import UIKit

class LocalServiceData: NSObject {

    
    //Creating a singleton shared instance 
    static let shared = LocalServiceData()
    
    //Creating a function to parse the local data
    func localDataParse(localData: @escaping(ProfileData) -> Void){
        //variable to store the local data
        let local = Bundle.main.url(forResource: "Profile", withExtension: "json")
        do{
            let myData = try Data(contentsOf: local!)
            let myLocalData = try JSONDecoder().decode(ProfileData.self, from: myData)
            
            //Returning the data
            localData(myLocalData)
        }
        catch{
            
        }
    }
}
