//
//  InfoViewController.swift
//  CalendarDayFinder
//
//  Created by anna.zubakina on 23/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescriptionLabel: UILabel!
    
    
    var info: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
                   appInfoLabel.text = "New Info Text"
                   appDescriptionLabel.text = "New Description Text"
               
           }
       }
