//
//  ArtistViewController.swift
//  Very Fine Arts
//
//  Created by Student on 10/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class AddNewArtistViewController: UIViewController {
    
    @IBOutlet weak var tfLastName: UITextField!
    
    @IBOutlet weak var tfFirstName: UITextField!
    
    @IBOutlet weak var tfDateOfBirth: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Add New Artist"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func add(){
        if let firstName = tfFirstName.text, let lastName = tfLastName.text, let dateOfBirth = Int(tfDateOfBirth.text!){
            let artist = Artist(firstName: firstName, lastName: lastName, dateOfBirth: dateOfBirth)
            Museum.shared.add(artist: artist)
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue:"Artist Added"), object: nil)
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }

}
