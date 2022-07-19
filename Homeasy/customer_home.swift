//
//  customer_home.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 17/07/2022.
//

import UIKit

class customer_home: UIViewController {

    var jobToRequest : String = ""
    var id : String = ""
    @IBAction func carpenter_action(_ sender: Any) {
        jobToRequest = "Carpenter"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func electrician_action(_ sender: Any) {
        jobToRequest = "Electrician"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func plumber_action(_ sender: Any) {
        jobToRequest = "Plumber"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func gardener_action(_ sender: Any) {
        jobToRequest = "Gardener"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func nanny_action(_ sender: Any) {
        jobToRequest = "Nanny"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func housekeeping_action(_ sender: Any) {
        jobToRequest = "House Keeping"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func cook_action(_ sender: Any) {
        jobToRequest = "Cook"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func painter_action(_ sender: Any) {
        jobToRequest = "Painter"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    @IBAction func ac_repair(_ sender: Any) {
        jobToRequest = "AC Repair"
        self.performSegue(withIdentifier: "home_book", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(customer_main.passID)
        id = customer_main.passID
        
//        var secondTab = self.tabBarController?.delegate.id
  //      print(secondTab)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        var vc = segue.destination as! customer_booking
        vc.jobToRequest = jobToRequest
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
