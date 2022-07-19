//
//  workers_requests.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 19/07/2022.
//

import UIKit
class workers_requests: UIViewController {

    @IBOutlet weak var scroll_view: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var rect : CGRect = CGRect(x: 0, y: 0, width: 200, height: 100)
        var tv : UITextView = UITextView(frame: rect)
        tv.text = "Testing"
        var rect2 : CGRect = CGRect(x: 0, y: 200, width: 200, height: 100)
        var tv2 : UITextView = UITextView(frame: rect2)
        tv2.text = "Testing2"
        scroll_view.addSubview(tv)
        scroll_view.addSubview(tv2)
        var btn : UIButton = UIButton(frame: CGRect(x: 200, y: 0, width: 200, height: 100))
        //btn.title = "Omar"
        scroll_view.addSubview(btn)
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
