//
//  ViewController.swift
//  profile-task
//
//  Created by surendra on 14/04/21.
//

import UIKit

class ViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var defaultView: UIView!
    
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    //Varialbes
    var defaultData:[String] = []
    var defaultData1:[String] = []
    var loginData:[String] = []
    var myAccData:[String] = []
    var aboutUS:[String] = []
    var settings:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // calling the function
        dataParser()
       
        
    }
    
    @IBAction func showProfile(_ sender: UIButton) {
        
        if defaultView.isHidden == true{
            defaultView.isHidden = false
            myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            myTableView.reloadData()
        }else{
            defaultView.isHidden = true
            
        }
        
        
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        defaultData = loginData
        myTableView.reloadData()
        
        loginButton.setTitle("logged In", for: .normal)
        
    }
        
    @IBAction func settingsAction(_ sender: UIButton) {
        
        defaultData = loginData
        myTableView.reloadData()
        backButton.isHidden = true
    }
}


//MARK: Local Service data
extension ViewController{
    
    func dataParser(){
        //Calling the local data parser method
        LocalServiceData.shared.localDataParse { [self] (ProfileData) in
            
            
            loginData =  ProfileData.login.map{$0.title}
            myAccData =  ProfileData.MyAccount.map{$0.title}
            aboutUS =  ProfileData.AboutUs.map{$0.title}
            defaultData = ProfileData.MyDefault.map{$0.title}
            defaultData1 = ProfileData.MyDefault.map{$0.title}
            settings = ProfileData.Settings.map{$0.title}
        }
    }
}

//MARK: Table view Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = defaultData[indexPath.row]
        
        if defaultData == loginData{
            if indexPath.row == 3 || indexPath.row == 4 || indexPath.row == 5{
                
                cell.accessoryType = .disclosureIndicator
            }
        }
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if defaultData == loginData{
            if indexPath.row == 4{
                defaultData = settings
                tableView.reloadData()
            }else if indexPath.row == 5{
                defaultData = aboutUS
                tableView.reloadData()
            }
            
        }
        if defaultData == settings{
            backButton.isHidden = false
            backButton.setTitle("<  Settings", for: .normal)
        }
    }
    
       
}

