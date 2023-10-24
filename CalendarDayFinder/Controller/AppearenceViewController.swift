//
//  AppearenceViewController.swift
//  CalendarDayFinder
//
//  Created by anna.zubakina on 23/10/2023.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeItemTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openSettings(_ sender: Any) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
    }
    
    
    func setLabelText() {
        var labelText = "Unable to specify UI style"
        if self.traitCollection.userInterfaceStyle == .dark {
                labelText = "Dark Mode is On"
            } else {
                labelText = "Light Mode is On"
            }
        textLabel.text = labelText
        
    }
        

}

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
