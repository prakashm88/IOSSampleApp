//
//  ViewController.swift
//  IOSSampleApp
//
//  Created by Prakash on 6/16/18.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    
    @IBAction func nameText(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func movetoNext(_ sender: Any) {
        print (username.text! ) ;
        //self.performSegue(withIdentifier: "detailViewCon  troller", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destController = segue.destination as! DetailViewController
        destController.userName = username.text!
    }
}

