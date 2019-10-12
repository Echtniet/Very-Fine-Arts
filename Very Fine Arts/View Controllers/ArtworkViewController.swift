//
//  ArtworkViewController.swift
//  Very Fine Arts
//
//  Created by Student on 10/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ArtworkViewController: UIViewController {
    var artwork:Artwork!
    
    
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCreation: UILabel!
    @IBOutlet weak var lblMedium: UILabel!
    @IBOutlet weak var swAuth: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        navigationItem.title = artwork.name
        lblPrice.text = formatter.string(from: artwork.price as NSNumber)
        lblCreation.text = "\(artwork.creationDate)"
        lblMedium.text = "\(artwork.medium)"
        swAuth.setOn(artwork.isAuthenticated, animated: true)
        
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
