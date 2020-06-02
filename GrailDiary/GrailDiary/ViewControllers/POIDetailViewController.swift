//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Timothy Rooney on 6/2/20.
//  Copyright © 2020 Timothy Rooney. All rights reserved.
//

import UIKit


class POIDetailViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    var poi: POI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        
        var clueText = ""
        for clue in poi.clues {
            clueText += "- \(clue)\n"
        }
        
        cluesTextView.text = clueText
    }
    
}
