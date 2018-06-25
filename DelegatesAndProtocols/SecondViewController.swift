//
//  SecondViewController.swift
//  DelegatesAndProtocols
//
//  Created by Adam Moore on 4/12/18.
//  Copyright © 2018 Adam Moore. All rights reserved.
//

import UIKit

// 1. Define protocol. It doesn't matter where it is created, as this is a top-level declaration, and can therefore be used all around the project.
protocol CanReceive {
    
    func dataReceived(data: String)
    
}

class SecondViewController: UIViewController {
    
    // 4. Create a new property that will do the delegating from this view controller
    
    // If there is no usage of this variable, i.e., no delegate is used or function used, the variable delegate named "delegate" will remain nil, and the stuff it is supposed to do, i.e., have a function called "dataReceived(data:)", it will NOT do, so nothing gets done and passed to the first view, i.e., the controller that conforms to the protocol.
    
    var delegatePenis: CanReceive?
    
    var data = String()
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBAction func secondButton(_ sender: UIButton) {
        
        // 5. Optional chaining used to run the "dataReceived" function if the delegate has been set, which was done on the first view in the lines "secondVC.delegatePenis = self". See, the delegate was defined here, so this Second View Controller is the main one who owns the Protocol and the Delegate declaration (not being the delegate itself, just creating a situation where a delegate is needed). So the "secondVC.delegatePenis = self" declaration is saying that the "delegate" variable created here is controlled by the first View Controller. In other words, "secondVC.delegatePenis = self" in the first View Controller is the line that sets the first View Controller as the one who does something with the "delegate" variable at the top of the Second View Controller class. So this function, "delegate?.dataReceived(data: secondTextField.text!)", only gets triggered if 1) there is a delegate to take care of it (i.e., the "secondVC.delegatePenis = self" situation), and 2) if the protocols required for "CanReceive" are fulfilled (i.e., the function declaration in the first View Controller). So this function "delegate?.dataReceived(data: secondTextField.text!)" gets sent to the actual delegate of the "CanReceive" protocol (which in this case is the first View Controller), and the parameter of the function, i.e., the "secondTextField.text!", gets sent to and used by the delegate, which is the first View Controller, and gets passed as the parameter for the function written in the first View Controller, since it is the delegate. In this instance, the functionality that gets performed with the "secondTextField.text!" is that it updates the first View Controller's text field.
        
        delegatePenis?.dataReceived(data: secondTextField.text!)
        
        // If you comment out the "dismiss()" function, the changes still take place, because of the "delegatePenis?.dataReceived(data: secondTextField.text!)" function call that the first View Controller, i.e., the delegate for the "CanReceive" protocol, makes. So basically, since the first View Controller is the delegate for this protocol, when this button is clicked, it does everything taht the "dataReceived()" function is set to do as written in the first View Controller.
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = data
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
