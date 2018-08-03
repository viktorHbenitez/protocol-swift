//
//  ViewController.swift
//  protocolsSwift3
//
//  Created by Victor  on 03/01/18.
//  Copyright © 2018 Victor . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    var strTitle : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear( animated)
        
        
        guard let title = strTitle else {return}
        
        self.title = title
        
    }
    /*
     MARK: step 5 create a reference of Class EditNameViewController and bind them through the prepareforsegue method or other one.*/
    @IBAction func editButtonTapped(_ sender: Any) {
        
        guard let myVC = self.storyboard?.instantiateViewController(withIdentifier: "MyViewController") as? EditNameViewController else { return }

        // 4. Indicamos que ViewController sera delegado de EditNameViewController
        myVC.delegate = self
    
        present(myVC, animated: true, completion: nil)
    }
    
}

//MARK: step 4 conform the protocol here.
extension ViewController: EditNameViewControllerDelegate {
    
    //MARK: step 6 finally use the method of the contract
    func editNameViewControllerDidFinish(newName: String?) {
        if let strTextUser = newName {
            strTitle = strTextUser
             lblName.text = strTextUser
        }
        dismiss(animated: true, completion: nil)
    }
}
