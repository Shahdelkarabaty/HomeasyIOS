//
//  PendingAppsCell.swift
//  Homeasy
//
//  Created by Shahd Elkarabaty on 19/07/2022.
//



import UIKit

class PendingAppsCell: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

  //  @IBOutlet weak var jobFieldCell: UILabel!
   // @IBOutlet weak var dateFieldCell: UILabel!
   // @IBOutlet weak var descriptionFieldCell: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad(){
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    let data = [["Test", "Test2"]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data[section].count
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "PendingAppsCell") as? PendingAppsCell {
//            cell.name = data[indexPath.section][indexPath.row]
//            return cell
//        }
//        return UITableViewCell()
//        <#code#>
//    }
    




        // Configure the view for the selected state
    
}
