//
//  ViewController.swift
//  Find My Age
//
//  Created by Rifqi Muhammad Aziz on 06/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateMyAge(_ sender: Any) {
        // get selected date from date picker (yyyy-mm-dd hh:mm:ss +0000)
        let birthDate = self.datePicker.date
        
        // get today date
        let today = Date()
        
        // check our birth date is earlier than today
        if birthDate >= today {
            let alertController = UIAlertController(
                title: "Error",
                message: "Please enter a valid date",
                preferredStyle: .alert)
            let alertAction = UIAlertAction(
                title: "yes",
                style: .default,
                handler: nil
            )
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        // create instance of the user's current calendar
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        guard let ageYears = components.year else {return}
        guard let ageMonth = components.month else {return}
        guard let ageDays = components.day else {return}
        
        self.ageLabel.text = "\(ageYears) years, \(ageMonth) months, \(ageDays) days"
    }
    
}

