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
    
    func findWeekDay() {
        guard let dayText = dayTextField.text, let monthText = monthTextField.text, let yearText = yearTextField.text,
            let day = Int(dayText), let month = Int(monthText), let year = Int(yearText) else {
                // Show an alert for invalid input
                let alert = UIAlertController(title: "Invalid Input", message: "Please enter valid numeric values for day, month, and year.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
        }

        // Validate the input (day should be between 1 and 31, month between 1 and 12)
        if day < 1 || day > 31 || month < 1 || month > 12 {
            let alert = UIAlertController(title: "Invalid Input", message: "Please enter valid values for day (1-31) and month (1-12).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }

        // Perform calculation and display the result
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

            // Change button text to "Clear"
            findDay.setTitle("Clear", for: .normal)
            dayTextField.text = ""
            monthTextField.text = ""
            yearTextField.text = ""
        }
    }

      
    
    @IBAction func findButtonTapped(_ sender: Any) {
        findWeekDay()
    }
}
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            // Get the new view controller using segue.destination.
            guard let vc = segue.destination as? InfoViewController
            else {
                return
            }
            // Pass the selected object to the new view controller.
            
        //    vc.info
        }
    
    }
    


