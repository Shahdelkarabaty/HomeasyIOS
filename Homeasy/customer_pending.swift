//
//  customer_pending.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 19/07/2022.
//

import UIKit
import FirebaseCore
import FirebaseDatabase
class customer_pending: UIViewController {
    
    var ref: DatabaseReference!

    @IBOutlet weak var jobPic1: UIImageView!
    @IBOutlet weak var datePic1: UIImageView!
    @IBOutlet weak var descPic1: UIImageView!
    @IBOutlet weak var jobText1: UILabel!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var decText1: UILabel!
    
    
    @IBOutlet weak var jobPic2: UIImageView!
    @IBOutlet weak var datePic2: UIImageView!
    @IBOutlet weak var descPic2: UIImageView!
    @IBOutlet weak var jobText2: UILabel!
    @IBOutlet weak var dateText2: UILabel!
    @IBOutlet weak var descText2: UILabel!
    
    
    @IBOutlet weak var jobPic3: UIImageView!
    @IBOutlet weak var datePic3: UIImageView!
    @IBOutlet weak var descPic3: UIImageView!
    @IBOutlet weak var jobText3: UILabel!
    @IBOutlet weak var dateText3: UILabel!
    @IBOutlet weak var descText3: UILabel!
    
    var back_pressed = false
    @IBAction func backbtn(_ sender: Any) {
        back_pressed = true
        self.performSegue(withIdentifier: "pending_main", sender: self)
    }
    
    func setfirst(job: String, date : String, desc:String)
    {
        jobText1.text = job
        dateText.text = date
        decText1.text = desc
        jobText1.isHidden = false
        dateText.isHidden = false
        decText1.isHidden = false
        jobPic1.isHidden = false
        datePic1.isHidden = false
        descPic1.isHidden = false
    }
    
    func setsecond(job: String, date : String, desc:String)
    {
        jobText2.text = job
        dateText2.text = date
        descText2.text = desc
        jobText2.isHidden = false
        dateText2.isHidden = false
        descText2.isHidden = false
        jobPic2.isHidden = false
        datePic2.isHidden = false
        descPic2.isHidden = false
    }
    
    func setthird(job: String, date : String, desc:String)
    {
        jobText3.text = job
        dateText3.text = date
        descText3.text = desc
        jobText3.isHidden = false
        dateText3.isHidden = false
        descText3.isHidden = false
        jobPic3.isHidden = false
        datePic3.isHidden = false
        descPic3.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        var user_ref = ref.child("customers").child(customer_main.passID)
        
        
        user_ref.observeSingleEvent(of: .value, with: {snapshot in
            let value = snapshot.value as? NSDictionary
            var list1 : [String] = value?["appointments"]
            as! [String]
            var output_text :[[String]] = [[String]]()
            for i in 0..<list1.count
            {
                var appRef = self.ref.child("appointments").child(list1[i]).observeSingleEvent(of: .value, with: {snapshot2 in
                    
                    let appointment = snapshot2.value as? NSDictionary
                    if appointment?["status"] as! String == "requested" || appointment?["status"] as! String == "worker_accepted"
                    {
                        var db_job : String = appointment?["jobType"] as! String
                        var datetemp : String = appointment?["date"] as! String
                        var timetemp : String = appointment?["time"] as! String
                        var db_date = datetemp + " " + timetemp
                        var db_description : String = appointment?["description"] as! String
                        output_text.append([db_job, db_date , db_description])
                    }
                    
                    if i == list1.count-1 {
                        if output_text.count >= 1 {
                            self.setfirst(job: output_text[0][0], date: output_text[0][1], desc: output_text[0][2])
                        
                        }
                        if output_text.count >= 2 {
                            self.setsecond(job: output_text[1][0], date: output_text[1][1], desc: output_text[1][2])
                                
                             }
                        
                        
                        if output_text.count >= 3 {
                        self.setthird(job: output_text[2][0], date: output_text[2][1], desc: output_text[2][2])
                        
                        }
                    }
                    
                    
                    
                 })
            }
            
            
            
        })
        
        // Do any additional setup after loading the view.
    
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }}
