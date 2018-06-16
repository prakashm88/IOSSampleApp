//
//  ViewController.swift
//  IOSSampleApp
//
//  Created by Prakash on 6/16/18.
//  Copyright © 2018 Prakash. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    enum Genders:String {
        case male = "Male"
        case female = "Female"
    }
    
    enum Nats:String {
        case AU = "AU"
        case BR = "BR"
        case CA = "CA"
        case DE = "DE"
        case DK = "DK"
        case ES = "ES"
        case FI = "FI"
        case FR = "FR"
        case GB = "GB"
        case IE = "IE"
        case IR = "IR"
        case NL = "NL"
        case NZ = "NZ"
        case TR = "TR"
        case US = "US"
    }
    
    let nats = [Nats.AU, Nats.BR, Nats.CA, Nats.DE, Nats.DK, Nats.ES, Nats.FI, Nats.FR, Nats.GB, Nats.IE, Nats.IR, Nats.NL, Nats.NZ, Nats.TR, Nats.US]
    
    let genders = [Genders.male, Genders.female]
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var genderValue: UIPickerView!
    @IBOutlet weak var nationalityValue: UIPickerView!
    
    var _genderValue: String = Genders.male.rawValue
    var _nationalityValue: String = Nats.AU.rawValue
    
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
        destController.genderValue = _genderValue
        destController.nationalityValue = _nationalityValue
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 0) {
            return nats.count
        } else {
            return genders.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 0) {
            return nats[row].rawValue
        } else {
            return genders[row].rawValue
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("inside did select row \(pickerView.tag)")
        if (pickerView.tag == 0) {
            _nationalityValue = nats[row].rawValue
        } else {
            _genderValue = genders[row].rawValue
        }
    }
    
}


