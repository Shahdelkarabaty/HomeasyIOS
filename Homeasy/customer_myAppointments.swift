//
//  customer_myAppointments.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 19/07/2022.
//

import UIKit
import FirebaseCore
import FirebaseDatabase
class customer_myAppointments: UIViewController {

    var ref: DatabaseReference!
    @IBOutlet weak var calendar1: UIImageView!
    @IBOutlet weak var clk1: UIImageView!
    @IBOutlet weak var job_Icon1: UIImageView!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var date1: UILabel!
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var job1: UILabel!
    
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var calendar2: UIImageView!
    @IBOutlet weak var clk2: UIImageView!
    @IBOutlet weak var job_Icon2: UIImageView!
    @IBOutlet weak var date2: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var job2: UILabel!
    
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var calendar3: UIImageView!
    @IBOutlet weak var clk3: UIImageView!
    @IBOutlet weak var job_Icon3: UIImageView!
    @IBOutlet weak var date3: UILabel!
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var job3: UILabel!
    
    
    func setfirst( date : String, time: String, job: String, name: String)
    {
        name1.text = name
        job1.text = job
        date1.text = date
        time1.text = time
        job1.isHidden = false
        date1.isHidden = false
        time1.isHidden = false
        calendar1.isHidden = false
        clk1.isHidden = false
        job_Icon1.isHidden = false
    }
    
    func setsecond( date : String, time: String, job: String, name: String)
    {
        name2.text = name
        job2.text = job
        date2.text = date
        time2.text = time
        job2.isHidden = false
        date2.isHidden = false
        time2.isHidden = false
        calendar2.isHidden = false
        clk2.isHidden = false
        job_Icon2.isHidden = false
    }
    func setthird( date : String, time: String, job: String, name: String)
    {
        name3.text = name
        job3.text = job
        date3.text = date
        time3.text = time
        job3.isHidden = false
        date3.isHidden = false
        time3.isHidden = false
        calendar3.isHidden = false
        clk3.isHidden = false
        job_Icon3.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        var customer_ref = ref.child("customers").child(customer_main.passID)
        
        customer_ref.observeSingleEvent(of: .value, with: {snapshot in
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
