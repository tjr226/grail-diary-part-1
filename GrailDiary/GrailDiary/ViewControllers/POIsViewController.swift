//
//  POIsViewController.swift
//  GrailDiary
//
//  Created by Timothy Rooney on 6/2/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit

class POIsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var POIs: [POI] = []
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            }
        }   else if segue.identifier == "ShowPOIDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow,
                let POIDetailVC = segue.destination as? POIDetailViewController {
                POIDetailVC.poi = POIs[indexPath.row]
            }
        }
    }

}

extension POIsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = POIs[indexPath.row]
        cell.poi = poi
        
        return cell
    }
}

extension POIsViewController: AddPOIDelegate {
    func POIWasCreated(_ poi: POI) {
        POIs.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}

