//
//  customer_booking.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 19/07/2022.
//

import UIKit
import FirebaseCore

import FirebaseDatabase

class customer_booking: UIViewController {

    var jobToRequest : String = ""
    var id : String = ""
    var Date : String = ""
    var Time = ""
    var Address = ""
    var jobDesc = ""
    var ref: DatabaseReference!
    var Day : Int = 0
    var Month: Int = 0
    var Year : Int = 0
    
    @IBOutlet weak var jobDescTextField: UITextView!
    @IBOutlet weak var AddressTextField: UITextField!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var jobTypeTextField: UILabel!
    
    
    @IBAction func onConfirmClick(_ sender: Any) {
        Address = AddressTextField.text ?? ""
        jobDesc = jobDescTextField.text ?? ""
        var date = DatePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year], from: date)
        Year = components.year ?? 0
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "LLLL"
        let monthString = dateFormatter2.string(from: date)
        components = calendar.dateComponents([.month], from: date)
        Month = components.month ?? 0
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "dd"
        let dayString = dateFormatter3.string(from: date)
        components = calendar.dateComponents([.day], from: date)
        Day = components.day ?? 0
        
        Date = monthString + " " + dayString + " " + yearString
        
        let dateFormatter4 = DateFormatter()
        dateFormatter4.timeStyle = DateFormatter.Style.short
        dateFormatter4.timeZone = TimeZone.current
        Time = dateFormatter4.string(from: date)
        print(time)
        
        var appointment_ref : DatabaseReference!
        appointment_ref = ref.child("appointments")
        appointment_ref = appointment_ref.childByAutoId()
        var appID = appointment_ref.key ?? ""
        
        let appointment : NSMutableDictionary  = ["address" : Address , "appID" : appID , "customerID" : id, "customerRated" : false, "customergotrated" : 0 , "date" : Date , "day" : Day, "description" : jobDesc, "jobType" : jobToRequest, "month" : Month, "price" : 0 , "status" : "requested" , "time" :  Time, "workerID" : "", "workerRated" : false, "workergotrated" : 0, "year" : Year]
        
        appointment_ref.setValue(appointment)
        
        var customer_ref = ref.child("customers").child(id)
        customer_ref.observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            var appstry = value?["appointments"]
            var apps : [String]
            if appstry == nil
            {
                apps = [String]()
            }
            else
            {
                apps =  value?["appointments"] as! [String]
            }
            apps.append(appID)
            customer_ref.child("appointments").setValue(apps)
            self.performSegue(withIdentifier: "booking_customermain", sender: self)
            
            
        })
        //Day = date.fo
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        jobTypeTextField.text = jobToRequest
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        var vc = segue.destination as! customer_main
        vc.id = id
        
        
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
