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
    //var obtainedResponse: RandomUsers = RandomUsers(dictionary: [String: String]() as NSDictionary)!
    var obtainedUser: Results = Results(dictionary: [String: String]() as NSDictionary)!
    fileprivate var randomUsersFactory = RandomUserFactory()

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var obtainedName: UILabel!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var responseDisplay: UITextView!
    @IBOutlet weak var reloadData: UIButton!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBAction func reloadData_click(_ sender: Any) {
        //showLoadingHUD()
        fetchUser()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(" \(userName) == \(nationalityValue) == \(genderValue) ")
        obtainedName.text = userName
        nationality.text = nationalityValue
        gender.text = genderValue
        
        fetchUser( )
        
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
    
    private func failure(code: Int, error: Error) {
        responseDisplay.text = error.localizedDescription
    }
    
    private func displayResult() {
        responseDisplay.text = "\(obtainedUser)"
        //personImageView.
        let imageUrl =  obtainedUser.picture?.thumbnail ;
        if let url = NSURL(string: imageUrl!) {
            if let data = NSData(contentsOf: url as URL) {
                self.personImageView.image = UIImage(data: data as Data)
            }
        }
    }
    
    fileprivate func fetchUser( ) {
        showLoadingHUD()
        
        let url = "https://randomuser.me/api/?nat=\(nationalityValue)" + "&gender=" + genderValue.lowercased() ;
        
        print("Fetching from URL " + url)
        
        let parameters = [
            "gender": genderValue.lowercased(),
            "nat": nationalityValue
        ]
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method:.get, parameters:parameters,
                          encoding: JSONEncoding.default, headers:headers).responseJSON {
                            
            [weak self] response in
            guard let strongSelf = self else { return }
                            
            switch response.result {
            case .success:
                print(response)
                guard response.result.isSuccess,
                let dictionaryObj = response.result.value as? NSDictionary else {
                        print ("Not an Expected response")
                        strongSelf.hideLoadingHUD()
                        return
                }
                /* let dictionaryArray = response.result.value as? [[String: Any]] else {
                        print ("Not an Expected response")
                        strongSelf.hideLoadingHUD()
                        return
                } */
                
                let randomUser: RandomUsers = strongSelf.randomUsersFactory.randomUsers(from: dictionaryObj)
                print ("RandomUserObtained \(randomUser)")
                //let randomUser = randomUsers[0]
                let results = randomUser.results ;
                let result:Results = results![0]
                print("Obtained User \(result) ")
                strongSelf.obtainedUser = result
                strongSelf.displayResult()
                 strongSelf.hideLoadingHUD()
            case .failure(let error):
                strongSelf.failure(code: 0,error: error)
                 strongSelf.hideLoadingHUD()
            }
           
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
