//
//  ViewController.swift
//  Homeasy
//
//  Created by auc on 16/07/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseCore


class ViewController: UIViewController {

    var ref: DatabaseReference!
    var user : User = User()
    var ID : String = ""
    var user_type : String = ""
    
    @IBOutlet weak var username_outlet: UITextField!
    
    @IBOutlet weak var password_outlet: UITextField!
    
    @IBAction func login_btn(_ sender: Any)
    {
        var Username : String = username_outlet.text ?? ""
        var Password : String = password_outlet.text ?? ""
        
        
        var user_ref: DatabaseReference!
        user_ref = ref.child("users")
        
        user_ref.queryOrdered(byChild: "username").queryEqual(toValue: Username).observeSingleEvent(of: .value, with: {snapshot in
            let value = snapshot.value as? NSDictionary
            let real_disctionary : NSDictionary = value?.allValues.first as! NSDictionary
            if value == nil
            {
                
            }
            else
            {
                let password = real_disctionary["password"]
                if (password as! String == Password)
                {
                    self.user_type = real_disctionary["type"] as! String
                    self.ID = real_disctionary["id"] as! String
                    print("test")
                    if self.user_type == "Customer"
                    {
                        self.performSegue(withIdentifier: "main_customer", sender: self)
                    }
                    else
                    {
                        self.performSegue(withIdentifier: "main_workers", sender: self)
                    }
                }
                else
                {
                    print("Password incorrect")
                    //say that password is incorrect
                }
            }
            /*guard let value = snapshot.value as? String else
            {
                return
            }*/
            //let user = value?["id"] as? String ?? ""
            
            
            
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        ref = Database.database().reference()
        /*
        var userSend : NSMutableDictionary  = ["id" : "myid" , "norated" : 0 , "password" : "youssef123", "rating" : 0, "type" : "Customer" , "username" : "Shahd" ]
        var userref = self.ref.child("users").childByAutoId()
        var ID = userref.key
        userSend["id"] = ID
        
        userref.setValue(userSend)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        if self.user_type == "Customer"
        {
            
            var vc = segue.destination as! customer_main
            vc.id = self.ID
        }
        else
        {
            var vc = segue.destination as! workers_main
            vc.id = self.ID
            
        }
        
        
//        if segue.destination is workers_main {
//            let vc = segue.destination as? workers_main
//            vc?.id = ID
//        }
    }
    


}

