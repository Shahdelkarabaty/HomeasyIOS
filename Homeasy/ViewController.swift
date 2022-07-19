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
        
        if (Username == "")
        {
            let alert = UIAlertController(title: "Username field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if (Password == "")
        {
            let alert = UIAlertController(title: "Password field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        var user_ref: DatabaseReference!
        user_ref = ref.child("users")
        
        user_ref.queryOrdered(byChild: "username").queryEqual(toValue: Username).observeSingleEvent(of: .value, with: {snapshot in
            let value = snapshot.value as? NSDictionary
            
            if value == nil
            {
                let alert = UIAlertController(title: "Username does not exist", message: "", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Reenter", style: .default))
                self.present(alert, animated: true, completion: nil)
//                incorrect username
            }
            else
            {
                let real_disctionary : NSDictionary = value?.allValues.first as! NSDictionary
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
                    let alert = UIAlertController(title: "Incorrect password", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Reenter", style: .default))
                    self.present(alert, animated: true, completion: nil)
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
        else if self.user_type == "Worker"
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

