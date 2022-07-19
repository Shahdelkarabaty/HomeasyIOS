//
//  verify_page.swift
//  Homeasy
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseCore


class verify_page: UIViewController {
    
    var ref: DatabaseReference!
    
    var phone : String = ""
    var userType : String = ""
    var username : String = ""
    var password : String = ""
    var name : String = ""
    var job : String = ""
    var codeToSend : String = ""
    var ID = ""

    @IBOutlet weak var codeEntered: UITextField!
    
    @IBOutlet weak var number_label: UILabel!
    
    @IBAction func verifyButton(_ sender: Any) {
        var enteredCode = codeEntered.text ?? ""
        if enteredCode == ""
        {
            let alert = UIAlertController(title: "Code field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        if (enteredCode == codeToSend)
        {
            var user_ref : DatabaseReference!
            user_ref = ref.child("users")
            user_ref = user_ref.childByAutoId()
            ID = user_ref.key ?? ""
             
                
            let userSend : NSMutableDictionary  = ["id" : ID , "norated" : 0 , "password" : password, "rating" : 0, "type" : userType , "username" : username ]
                 
                 
            user_ref.setValue(userSend)
            
            if (userType == "Worker")
            {
                var worker_ref : DatabaseReference!
                worker_ref = ref.child("workers").child(ID ?? "")
                let workerSend : NSMutableDictionary  = ["id" : ID , "jobType" : job , "name" : name, "norated" : 0, "password" : password , "phone" : phone, "rating" : 0, "type" : userType, "username" : username ]
                worker_ref.setValue(workerSend)
                self.performSegue(withIdentifier: "verify_workersmain", sender: self)
            } else
            {
                var customer_ref : DatabaseReference!
                customer_ref = ref.child("customers").child(ID ?? "")
                let customerSend : NSMutableDictionary  = ["id" : ID , "name" : name, "norated" : 0, "password" : password , "phone" : phone, "rating" : 0, "type" : userType, "username" : username ]
                customer_ref.setValue(customerSend)
                self.performSegue(withIdentifier: "verify_customermain", sender: self)
            }
        } else
        {
            let alert = UIAlertController(title: "Incorrect code entered", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        var sms_ref: DatabaseReference!
        number_label.text = phone
        
        
        
        for i in 0...5 {
            var int_random : Int = Int.random(in: 0..<10)
            codeToSend += String(int_random)
        
        }
        
        sms_ref = ref.child("sms").childByAutoId()
        var smsID = sms_ref.key
         
             
        let smsSend : NSMutableDictionary  = ["body" : codeToSend , "phone" : phone , "sent" : false ]
             
             
        sms_ref.setValue(smsSend)
       
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if userType == "Customer"
        {
            var vc = segue.destination as! customer_main
            vc.id = ID
            vc.name = name
            vc.norated = 0
            vc.password = password
            vc.phone = phone
            vc.rating = 0
            vc.type = userType
            vc.username = username
            
        }
        else
        {
            var vc = segue.destination as! workers_main
            vc.id = ID
            vc.name = name
            vc.norated = 0
            vc.password = password
            vc.phone = phone
            vc.rating = 0
            vc.type = userType
            vc.username = username
            vc.jobType = job
            //var vc
        }
        
    }
        
        
        
        
        // Do any additional setup after loading the view.

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
