//
//  ViewController.swift
//  Project5
//
//  Created by user118223 on 4/26/16.
//  Copyright © 2016 user118223. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
// Mark: Properties
    
    @IBOutlet weak var month1TextField: UITextField!
    
    @IBOutlet weak var day1TextField: UITextField!
    
    
    @IBOutlet weak var year1TextField: UITextField!
    
    
    @IBOutlet weak var month2TextField: UITextField!
    
    
    @IBOutlet weak var day2TextField: UITextField!
    
    
    @IBOutlet weak var year2TextField: UITextField!
    
    
    @IBOutlet weak var resultLabel: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //function to validate user entered values in text fields
    
    func validate_Input() ->(Bool){
        
        var day1 = Int(day1TextField.text!)
        var day2 = Int(day2TextField.text!)
        var month1 = Int(month1TextField.text!)
        var month2 = Int(month2TextField.text!)
        var year1 = Int(year1TextField.text!)
        var year2 = Int(year2TextField.text!)
        
        //validate none of the fields are empty or non-numeric
        if day1 == nil || day2 == nil || month1 == nil || month2 == nil || year1 == nil || year2 == nil {
        
            resultLabel.text = "Error: Field(s) are either empty or non-numeric values were entered."
            return false
        }
        
        //validate year is non-zero for Date1 and Date2
        if year1 == 0 || year2 == 0 {
        
            resultLabel.text = "Error: year in Date1 or Date2 is invalid. Year cannot be zero."
            return false
        
        }
        
        //validate month is not greater than 12 for Date1 and Date2
        
        if month1 > 12 || month2 > 12 {
        
            resultLabel.text = "Error: Month in Date1 or Date2 is invalid. Month cannot be greater than 12."
            return false
        
        }
        
        //validate month is non-zero for Date1 and Date2
        
        if month1 == 0 || month2 == 0 {
        resultLabel.text = "Error: Month in Date1 or Date2 is invalid. Month cannot be zero."
        return false
        }
        
        //validate day is non-zero for Date1 and Date2
        
        if day1 == 0 || day2 == 0 {
            resultLabel.text = "Error: Day in Date1 or Date2 is invalid. Day cannot be zero."
            return false
        }
        
        //validate number of days for entered month in Date1
        if (month1 == 1 || month1 == 3 || month1 == 5 || month1 == 7 || month1 == 8 || month1 == 10 || month1 == 12) && day1 > 31 {
        
        resultLabel.text = "Error: Date1 - Invalid number of days in entered month. "
            return false
            
        }
        
        else if month1 == 2 && day1 > 28 {
        
            if ((year1! % 4 == 0 && year1! % 100 != 0) || year1! % 400 == 0) && day1 == 29 {
            
            
            }
            
            else {
            resultLabel.text = "Error: Date1 - Invalid number of days in entered month. "
                return false
            }
        
        }
        
        else if (month1 == 4 || month1 == 6 || month1 == 9 || month1 == 11) && day1 > 30 {
            
        resultLabel.text = "Error: Date1 - Invalid number of days in entered month. "
            return false
        }
        
        //Validate number of days for entered month in Date2
        if (month2 == 1 || month2 == 3 || month2 == 5 || month2 == 7 || month2 == 8 || month2 == 10 || month2 == 12) && day2 > 31 {
            
            resultLabel.text = "Error: Date2 - Invalid number of days in entered month. "
            return false
            
        }
            
        else if month2 == 2 && day2 > 28 {
            
            if ((year2! % 4 == 0 && year2! % 100 != 0) || year2! % 400 == 0) && day2 == 29 {
                
                
            }
                
            else {
                resultLabel.text = "Error: Date2 - Invalid number of days in entered month. "
                return false
            }
            
        }
            
        else if (month2 == 4 || month2 == 6 || month2 == 9 || month2 == 11) && day2 > 30 {
            
            resultLabel.text = "Error: Date2 - Invalid number of days in entered month. "
            return false
        }
//Validate Date1 precedes Date2
        if year2 < year1 {
        resultLabel.text = "Error: Date2 is less than Date1."
            return false
        
        }
        if year2 == year1 && month2 < month1 {
            resultLabel.text = "Error: Date2 is less than Date1."
            return false
            
        }
        if year2 == year1 && month2 == month1 && day2 < day1 {
            resultLabel.text = "Error: Date2 is less than Date1."
            return false
            
        }
        return true
    
    }
    
    // Mark: Actions
    @IBAction func calculateDays(sender: UIButton) {
        
        
        
        if(validate_Input()){
            //GregorianDate class instances created. Class created in GregorianDate.swift file
        var Date1 = GregorianDate(day: Int(day1TextField.text!)!, month: Int(month1TextField.text!)!, year: Int(year1TextField.text!)!)
        
        var Date2 = GregorianDate(day: Int(day2TextField.text!)!, month: Int(month2TextField.text!)!, year: Int(year2TextField.text!)!)
            
            //difference_between_dates method of GregorianDate class used to calculate difference in days
        resultLabel.text = "Difference between dates: \(Date1.getDay())/\(Date1.getMonth())/\(Date1.getYear()) and \(Date2.getDay())/\(Date2.getMonth())/\(Date2.getYear()) is \(String(Date1.difference_between_dates(Date2))) days"
            
            
 
        }
        //Hide keyboard when user clicks 'Calculate' button
      day1TextField.resignFirstResponder()
    day2TextField.resignFirstResponder()
        month1TextField.resignFirstResponder()
        month2TextField.resignFirstResponder()
        year1TextField.resignFirstResponder()
    year2TextField.resignFirstResponder()    }
}

