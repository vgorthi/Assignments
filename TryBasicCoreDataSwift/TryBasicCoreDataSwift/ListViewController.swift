//
//  ListViewController.swift
//  TryBasicCoreDataSwift
//
//  Created by pavan krishna on 29/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var listTableViwe: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCellIdentifier") as? CreditCardTableViewCell
        cell?.nameLabel.text = "hello"
        cell?.aprLabel.text = "hello"
        cell?.creditMaxLabel.text = "hello"
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
