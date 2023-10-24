//
//  ViewController.swift
//  CalendarDayFinder
//
//  Created by anna.zubakina on 23/10/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var findDay: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    var isResultDisplayed = false
    
    func findWeekDay() {
        guard let dayText = dayTextField.text, let monthText = monthTextField.text, let yearText = yearTextField.text,
            let day = Int(dayText), let month = Int(monthText), let year = Int(yearText) else {
                
                let alert = UIAlertController(title: "Invalid Input", message: "Please enter valid numeric values for day, month, and year.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
        }

        if day < 1 || day > 31 || month < 1 || month > 12 {
            let alert = UIAlertController(title: "Invalid Input", message: "Please enter valid values for day (1-31) and month (1-12).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        if let date = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE"
            let dayOfWeekString = dateFormatter.string(from: date)
            resultLabel.text = dayOfWeekString

            findDay.setTitle("Clear", for: .normal)
                    isResultDisplayed = true
                } else {
                    print("Invalid date")
                }
        }

      
    
    @IBAction func findButtonTapped(_ sender: Any) {
        if isResultDisplayed {
                dayTextField.text = ""
                monthTextField.text = ""
                yearTextField.text = ""
                resultLabel.text = ""
                findDay.setTitle("Find", for: .normal)
                isResultDisplayed = false
            } else {
                findWeekDay()
            }
    }

}
    // MARK: - Navigation

func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "info" {
        print("Preparing for segue: info")
        if let vc = segue.destination as? InfoViewController {
            let dayOfWeekString = "Monday"
            vc.dayOfWeekString = dayOfWeekString
            vc.setupUI()
        }
    }
}

