//
//  register_page.swift
//  Homeasy
//
//  Created by CSE on 18/07/2022.
//

import UIKit
import FirebaseDatabase
import FirebaseCore


class register_page: UIViewController {

    @IBOutlet weak var toggle_type: UISwitch!
    
    @IBOutlet weak var name_field: UITextField!
    
    @IBOutlet weak var username_field: UITextField!
    
    @IBOutlet weak var jobTypeText: UILabel!
    var user_ref: DatabaseReference!
    var ref: DatabaseReference!
    var flag: Bool = false
  
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var password_field: UITextField!
    
    @IBOutlet weak var repassword_field: UITextField!
    
    @IBOutlet weak var phone_field: UITextField!
    
    @IBOutlet weak var dropdown: UIButton!
    
    var Name : String = ""
    var Username : String = ""
    var Password  : String = ""
    var RePassword : String = ""
    var Phone : String = ""
    var userType : String = ""
    var jobType : String = ""
    
    @IBAction func onClickRegister(_ sender: Any) {
        flag = true
        Name = name_field.text ?? ""
        Username = username_field.text ?? ""
        Password = password_field.text ?? ""
        RePassword = repassword_field.text ?? ""
        Phone = phone_field.text ?? ""
        jobType = "Carpenter"
        
        if toggle_type.isOn
        {
            userType = "Worker"
    
        } else {
            userType = "Customer"
        }
        if Name == ""
        {
            let alert = UIAlertController(title: "Name field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        if Username == ""
        {
            let alert = UIAlertController(title: "Username field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        if Password == ""
        {
            let alert = UIAlertController(title: "Password field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        if RePassword == ""
        {
            let alert = UIAlertController(title: "Reenter Password field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        if Password != RePassword
        {
            print("Passwords not equal")
            let alert = UIAlertController(title: "Passwords do not match", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        if Phone == ""
        {
            let alert = UIAlertController(title: "Phone field is empty", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Reenter", style: .default))
            self.present(alert, animated: true, completion: nil)
            flag = false
            return
        }
        
        self.performSegue(withIdentifier: "register_verify", sender: self)
   //    user_ref = user_ref.childByAutoId()
       // var ID = user_ref.key
    
        
      //  let userSend : NSMutableDictionary  = ["id" : ID! , "norated" : 0 , "password" : Password, "rating" : 0, "type" : userType , "username" : Username ]
        
        
      //  user_ref.setValue(userSend)
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setdropdown()
        
        ref = Database.database().reference()
        user_ref = ref.child("users")
        
        
        
        
        
        
        
        //self.dropdown.setValue("Carpenter", forKey: "Carpenter")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onToggle(_ sender: Any) {
        if toggle_type.isOn
        {
            dropdown.isHidden = false
            jobTypeText.isHidden = false
            arrow.isHidden = false
            
        } else {
            dropdown.isHidden = true
            jobTypeText.isHidden = true
            arrow.isHidden = true
            
        }
        
    }
    func setdropdown()
    {
        let option = {(action : UIAction) in
            print(action.title)
            self.jobType = action.title
        }
        
        self.dropdown.menu = UIMenu (children : [
            UIAction (title : "Carpenter", handler:  option),
            UIAction (title : "Electrician", handler:  option),
            UIAction (title : "Plumber", handler:  option),
            UIAction (title : "Gardener", handler:  option),
            UIAction (title : "Nanny", handler:  option),
            UIAction (title : "Housekeeping", handler:  option),
            UIAction (title : "Cook", handler:  option),
            UIAction (title : "Painter", handler:  option),
            UIAction (title : "AC Repair", handler:  option)
        ])
        
        dropdown.showsMenuAsPrimaryAction = true
        dropdown.changesSelectionAsPrimaryAction = true
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        
        if (flag)
        {
            var vc = segue.destination as! verify_page
            vc.phone = Phone
            vc.userType = userType
            vc.username = Username
            vc.password = RePassword
            vc.name = Name
            
            if userType == "Worker"
            {
                vc.job = jobType
            }
        }
        
        
        
    
        
        
        
        
        
//        if segue.destination is workers_main {
//            let vc = segue.destination as? workers_main
//            vc?.id = ID
//        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
