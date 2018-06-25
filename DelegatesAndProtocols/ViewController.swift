//
//  ViewController.swift
//  DelegatesAndProtocols
//
//  Created by Adam Moore on 4/12/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

// 2. Conform to the protocol created, i.e. "CanReceive", in our case.
// This allows it to do the delegation and, with the proper code written below, control another view controller with a variable that is of the type "CanReceive", to run its code.
class ViewController: UIViewController, CanReceive {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var firstTextField: UITextField!
    
    @IBAction func firstButton(_ sender: UIButton) {
        performSegue(withIdentifier: "sendDataForward", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sendDataForward" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.data = firstTextField.text!
            
            // Defines itself, this class, as the one who controls the functionality of the "CanReceive" delegate variable in the Second View Controller
            secondVC.delegatePenis = self
            
        }
        
    }
    
    // 3. Write a function that is required by the protocol, which in this case is called "dataReceived(data:)"
    func dataReceived(data: String) {
        
        // As a test, this prints the data to the console upon clicking the button, even before the view gets seen.
        print(data)
        label.text = data
        
        // This prints the label text to the console, even without the view loading. If you comment out the "dismiss" function, so the Second View Controller stays in view, this still prints out, because the function has been executed from the Second View Controller, because of this first View Controller being the delegate of the "CanReceive" protocol function.
        print(label.text!)
    }

}








