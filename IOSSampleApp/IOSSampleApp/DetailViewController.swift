//
//  DetailViewController.swift
//  IOSSampleApp
//
//  Created by XCodeClub on 2018-06-16.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var userName:String = ""
    var genderValue:String = ""
    var nationalityValue:String = ""

    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var nationality: UILabel!
    @IBOutlet weak var obtainedName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(" \(userName) == \(nationalityValue) == \(genderValue) ")
        obtainedName.text = userName
        nationality.text = nationalityValue
        gender.text = genderValue
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
