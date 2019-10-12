//
//  ViewController.swift
//  Very Fine Arts
//
//  Created by Student on 10/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddNewArtworkViewController: UIViewController {
    var artist:Artist!
    
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblPrice: UITextField!
    @IBOutlet weak var lblCreation: UITextField!
    @IBOutlet weak var lblMedium: UITextField!
    @IBOutlet weak var swIsAuth: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Artwork"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func add(){
        if let name = lblName.text, let price = Double(lblPrice.text!), let creation = Int(lblCreation.text!), let medium = lblMedium.text {
            let isAuth = swIsAuth.isOn
            let trueMedium:Medium
            switch medium{
            case "oil":
                trueMedium = .oil
            case "watercolor":
                trueMedium = .watercolor
            case "acrylic":
                trueMedium = .acrylic
            default:
                trueMedium = .other
            }
            
            let artwork = Artwork(name: name, price: price, creationDate: creation, medium: trueMedium, isAuthenticated: isAuth)
            artist.add(artwork: artwork)
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Artwork Added"), object: nil)
            self.dismiss(animated: true, completion: nil)
 
        }
        
        
    }


}

