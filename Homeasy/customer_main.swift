//
//  customer_main.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 17/07/2022.
//

import UIKit

class customer_main: UITabBarController {
    var id : String = ""
    var name : String = ""
    var norated : Int = 0
    var password :String = ""
    var phone : String = ""
    var rating : Float = 0.0
    var type : String = ""
    var username : String = ""
    static var passID : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        customer_main.passID = id
        
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
