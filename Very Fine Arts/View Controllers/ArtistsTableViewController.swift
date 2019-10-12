//
//  ArtistsTableViewController.swift
//  Very Fine Arts
//
//  Created by Student on 10/12/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit

class ArtistsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        NotificationCenter.default.addObserver(self, selector: #selector(artistAdded), name: NSNotification.Name(rawValue:"Artist Added"), object: nil)
    }
    
    @objc func artistAdded(notification:Notification){
        tableView.reloadData()
    }
    
    @objc func add(){
        let navCon = storyboard?.instantiateViewController(withIdentifier: "AddNewArtistVCNavCon")
        
        self.present(navCon!, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Museum.shared.numArtists()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artist", for: indexPath)
        
        let artist = Museum.shared[indexPath.row]
        
        cell.textLabel?.text = "\(artist.lastName), \(artist.firstName)"
        cell.detailTextLabel?.text = "\(Museum.shared[indexPath.row].dateOfBirth)"

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artworksTVC = storyboard!.instantiateViewController(withIdentifier: "ArtworksTVC") as! ArtworksTableViewController
        
        artworksTVC.artist = Museum.shared[indexPath.row]
        
        self.navigationController!.pushViewController(artworksTVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Museum.shared.deleteArtist(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
}
