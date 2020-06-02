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
    
    
// DELETED in guided project implementation
//    override func viewDidLoad() {
//        super.viewDidLoad()

        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension POIsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return POIs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let POI = POIs[indexPath.row]
        cell.POI = POI
        
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

