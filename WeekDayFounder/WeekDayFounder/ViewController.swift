//
//  ViewController.swift
//  WeekDayFounder
//
//  Created by Roman Korobskoy on 10.10.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func findDay(_ sender: UIButton) {
        
        guard let day = dataTextField.text, let month = monthTextField.text, let year = yearTextField.text else {return}
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "EEEE" // формат даты - полный день недели
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let weekday = dateFormatter.string(from: date) //day week
        let capitalizeWeekday = weekday.capitalized //делаем первую букву большой
        
        resultLabel.text = capitalizeWeekday

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //убираем клавиатуру
    }
}

