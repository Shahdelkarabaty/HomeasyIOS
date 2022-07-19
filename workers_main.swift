//
//  workers_main.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 17/07/2022.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class workers_main: UIViewController {


    
    @IBOutlet weak var Welcome_label: UILabel!
    var id :String = ""
    var name : String = ""
    var norated : Int = 0
    var password :String = ""
    var phone : String = ""
    var rating : Float = 0.0
    var type : String = ""
    var username : String = ""
    var jobType : String = ""
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        var workers_ref = self.ref.child("workers").child(self.id)
        workers_ref.observeSingleEvent(of: .value, with: { [self]snapshot in
            let value = snapshot.value as? NSDictionary
            name 
            Welcome_label.text = "Welcome " + self.name + "!"
        })
        
        
        
        
        
        print(id)
        // Do any additional setup after loading the view.
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
