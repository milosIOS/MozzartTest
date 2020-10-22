//
//  DateHandler.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/26/20.
//

import Foundation
class DateHandler {
    enum DateFormat: String {
        case short = "yyyy-mm-dd"
    }
    
    func drawCompletedAt(drawTime:Double?) -> String {
        guard let drawTime = drawTime else { return "Common.NotFinished".localized }
        //MARK:- Time management
        /// Returns formatted time when draw will happen
            let date = Date(timeIntervalSince1970:(drawTime/1000))
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = .short
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return localDate
        
    }
    
    
    func getDateStringFrom(unixTimeStamp: Double, format: DateFormat) -> String {
        let date = Date(timeIntervalSince1970: unixTimeStamp/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = .current
        return dateFormatter.string(from: date)
    }
    
    func getDateStringFrom(date: Date, format: DateFormat) -> String {
        let todaysDate =  Date()
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = .current
        let todayString:String = dateFormatter.string(from: todaysDate)
        
        return todayString
    }
    
}

private extension Date {
    func getFormattedDateString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.string(from: self)
    }
}


