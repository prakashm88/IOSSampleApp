//
//  DetailViewController.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

class DetailViewController: UIViewController {
    
    var userName:String = ""
    var genderValue:String = ""
    var nationalityValue:String = ""

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var obtainedName: UILabel!
    @IBOutlet var contentView: UIView!
    
    fileprivate var randomUsersFactory = RandomUserFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         showLoadingHUD()
        print(" \(userName) == \(nationalityValue) == \(genderValue) ")
        obtainedName.text = userName
        nationality.text = nationalityValue
        gender.text = genderValue
        
        fetchUser(gender: genderValue, nationality: nationalityValue, randomToken: userName)
        
       // hideLoadingHUD()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func showLoadingHUD() {
        let hud = MBProgressHUD.showAdded(to: contentView, animated: true)
        hud.label.text = "Loading..."
    }
    
    private func hideLoadingHUD() {
        MBProgressHUD.hide(for: contentView, animated: true)
    }
    
    fileprivate func fetchUser(gender: String, nationality: String, randomToken: String) {
       // showLoadingHUD()
        
        Alamofire.request(
            "https://randomuser.me/api/",
            method: .get,
            encoding: PropertyListEncoding(format: .xml, options: 0)).responsePropertyList {
                [weak self] response in
                
                guard let strongSelf = self else { return }
                
                strongSelf.hideLoadingHUD()
                
                guard response.result.isSuccess,
                    let dictionaryArray = response.result.value as? [[String: String]] else {
                        return
                }
                
               /* strongSelf.flavors = strongSelf.flavorFactory.flavors(from: dictionaryArray)
                strongSelf.collectionView.reloadData()
                strongSelf.selectFirstFlavor() */
                
                let randomUsers = strongSelf.randomUsersFactory.randomUsers(from: dictionaryArray)
                print ("RandomUserObtained \(randomUsers)")
                
                strongSelf.hideLoadingHUD()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
