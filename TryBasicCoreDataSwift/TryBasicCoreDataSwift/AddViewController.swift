//
//  AddViewController.swift
//  TryBasicCoreDataSwift
//
//  Created by pavan krishna on 29/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var maxCreditTextField: UITextField!
    
    @IBOutlet weak var aprTextField: UITextField!
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        
        
        
    }
    
    
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

}
