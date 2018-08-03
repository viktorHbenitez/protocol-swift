//
//  EditNameViewController.swift
//  protocolsSwift3
//
//  Created by Victor  on 03/01/18.
//  Copyright © 2018 Victor . All rights reserved.
//

import UIKit

//MARK: step 1. Create and add protocol
protocol EditNameViewControllerDelegate: class{
    func editNameViewControllerDidFinish(newName: String?)
}

class EditNameViewController: UIViewController {

    @IBOutlet weak var txfName: UITextField?
  
    //MARK: step 2.Create a delegate property here
    weak var delegate: EditNameViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfName?.becomeFirstResponder()
    }
    

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        
        //MARK: step 3. Add the delegate method call here.
        delegate?.editNameViewControllerDidFinish(newName: (txfName?.text)!)
    }
    

}
