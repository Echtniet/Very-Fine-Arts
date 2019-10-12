//
//  ArtworksTableViewController.swift
//  Very Fine Arts
//
//  Created by Student on 10/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ArtworksTableViewController: UITableViewController {
    var artist:Artist!
    
    let rowHeight:CGFloat = 60.0
    
    let artnameLabelTag = 100
    let priceLabelTag = 200
    let creationLabelTag = 300
    let mediumLabelTag = 400
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = artist.lastName
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: artist.lastName, style: .plain, target: nil, action: nil)

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    
        NotificationCenter.default.addObserver(self, selector: #selector(artistAdded), name: NSNotification.Name(rawValue:"Artwork Added"), object: nil)
    }

    @objc func artistAdded(notification:Notification){
        tableView.reloadData()
    }

    @objc func add(){
        let addArtworkVC = storyboard?.instantiateViewController(withIdentifier: "AddNewArtWorkVCNavCon") as! UINavigationController
        (addArtworkVC.topViewController as! AddNewArtworkViewController).artist = artist
        //let navCon = storyboard?.instantiateViewController(withIdentifier: "AddNewArtWorkVCNavCon")
        
        self.present(addArtworkVC, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return artist.numArtworks()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customartwork", for: indexPath)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let artwork = artist[indexPath.row]
        
        let nameLabel = cell.viewWithTag(artnameLabelTag) as! UILabel
        let creatiobLabel = cell.viewWithTag(creationLabelTag) as! UILabel
        let mediumLabel = cell.viewWithTag(mediumLabelTag) as! UILabel
        let priceLabel = cell.viewWithTag(priceLabelTag) as! UILabel
        
        nameLabel.text = artwork.name
        creatiobLabel.text = "\(artwork.creationDate)"
        mediumLabel.text = "\(artwork.medium)"
        priceLabel.text = formatter.string(from: artwork.price as NSNumber)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artworkVC = storyboard!.instantiateViewController(withIdentifier: "ArtworkVC") as! ArtworkViewController
        
        artworkVC.artwork = artist[indexPath.row]
        
        self.navigationController!.pushViewController(artworkVC, animated: true)
    }
}
