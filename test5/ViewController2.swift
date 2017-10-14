//
//  ViewController2.swift
//  test5
//
//  Created by MACBOOK on 8/28/17.
//  Copyright © 2017 MACBOOK. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController2: UIViewController {
    var ref = FIRDatabase.database().reference().child("ATWAH").child("عصام عطوة").child("الادوية")
    
    
    
    @IBOutlet weak var BarCode: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var type: UISegmentedControl!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var expire: UITextField!
    @IBOutlet weak var albadel: UITextField!
    @IBOutlet weak var saralbadel: UITextField!
    @IBOutlet weak var alather: UITextView!
    @IBOutlet weak var arad: UITextView!
    var TextOFTeype = "برشام"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView(gesture:)))
//        view.addGestureRecognizer(tapGesture)
//
        scrollView.contentSize.height = 1000
    }

    @IBAction func typeA(_ sender: UISegmentedControl)
    {
        switch type.selectedSegmentIndex {
        case 0:
            TextOFTeype = "برشام"
        case 1:
            TextOFTeype = "حقن"
        case 2:
            TextOFTeype = "شرب"
        case 3:
            TextOFTeype = "مراهم"
        case 4:
            TextOFTeype = "لبوس"
        case 5:
            TextOFTeype = "مكياج"
        default:
            TextOFTeype = "برشام"
        }
    }
    //https://www.linkedin.com/feed/update/urn:li:activity:6321303706419683329
    @IBAction func Addd(_ sender : UIButton){
        if (name.text != nil && price.text != nil &&  expire.text  != nil && saralbadel.text != nil &&  albadel.text != nil && alather.text != nil && arad.text != nil ){
                AddOnDataBase()
        }else{
            createAlert(title: "Error", massage: "The value in not complete check it")
        }
        
    }
    
    func createAlert(title : String , massage : String)
    {
        let alert = UIAlertController.init(title:title , message: massage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: UIAlertActionStyle.destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert , animated: true, completion: nil)
    }
    func AddOnDataBase(){
        
            ref.child(TextOFTeype).child(name.text!).setValue(
                ["Barcode" : BarCode.text!,"Price" : Double(price.text!)!  ,"Expire" : expire.text! ,
                "سعر البديل" : saralbadel.text! ,
                "البديل" : albadel.text! , "why to use it" : alather.text! , "the side effects" : arad.text!
                ]
        )
        
            print("Done")
    }


}
/*
 guard let nameE = name.text else{
 print( "name sussece")
 return
 }
 guard let priceE = price.text else{
 print( "price sussece")
 return
 }
 guard let expireE = expire.text else{
 print( "price sussece")
 return
 }
 guard let albadelE = albadel.text else{
 print( "albadel sussece")
 return
 }
 guard let saralbadelE = saralbadel.text else{
 print( "saralbadel sussece")
 return
 }
 guard let alatherE = alather.text else{
 print( "alather sussece")
 return
 }
 guard let aradE = arad.text else{
 print( "arad sussece")
 return
 }
 guard let PriceDouble = Int(priceE)
 else {
 print( "connot PriceDouble canvert data type from string to double")
 return
 }
 guard let saralbadelDouble = Int(saralbadelE)
 else {
 print( "connot saralbadelDouble canvert data type from string to double")
 return
 }
 */
