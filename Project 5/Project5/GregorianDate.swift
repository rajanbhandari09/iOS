//
//  GregorianDate.swift
//  Project5
//
//  Created by user118223 on 4/26/16.
//  Copyright © 2016 user118223. All rights reserved.
//GregorianDate class to initialize dates, calculate difference between two dates. Additional functions - return number of days in a month, check if leap year.

import UIKit

class GregorianDate {

// Mark: Properties
    var day: Int
    var month: Int
    var year: Int
    
    // Mark: Initialization
    init (day: Int, month: Int, year: Int) {
    
    self.day = day
        self.month = month
        self.year = year
    
    
    }
    
    //Getter functions for day, month and year
    func getDay() -> (Int){
    
    return self.day
    
    }
    
    func getMonth() -> (Int){
    
    return self.month
    
    }
    
    func getYear() -> (Int){
    return self.year
    
    }
    
    //Function to check leap year
    func check_Leap_Year(year:Int) -> (Bool) {
        if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0 {
            return true
        }
        else {
            return false
            
        }
        
        
    }
    
    
    //Function to return number of days in a month
    func days_in_month(month: Int, year: Int) -> (Int) {
        if month == 1 || month == 3 || month == 5 || month == 7 || month == 8  || month == 10 || month == 12 {
            
            return 31
            
        }
            
        else if month == 2 {
            
            if check_Leap_Year(year){
                return 29
            }
                
            else {
                
                return 28
                
            }
            
        }
            
        else {
            
            return 30
        }
        
    }
    
    //Function to calculate difference between 2 GregorianDate class instances
    
    func difference_between_dates(Date: GregorianDate) -> (Int) {
        var totaldays = 0
        var currentyear = self.year
        var currentmonth = self.month
        var currentday = self.day
        
        for j in currentyear...Date.getYear() {
            
            if Date.getYear() - j == 0 {
                
                for i in currentmonth...Date.getMonth() {
                    
                    if Date.getMonth() - i == 0 {
                        totaldays += Date.getDay() - currentday
                    }
                        
                    else {
                        
                        totaldays += days_in_month(i, year: j) - currentday
                        
                        
                    }
                    
                    
                    currentday = 0
                    
                }
                
                
                
                
            }
                
            else {
                
                
                for k in currentmonth...12 {
                    
                    totaldays += days_in_month(k, year: j) - currentday
                    
                    
                    currentday = 0
                    
                    
                }
                
                
                
                currentmonth = 1
                
            }
            
            
            
            
        }
        
        return totaldays
    
    
    }



}
