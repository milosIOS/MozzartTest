//
//  ServerAPI.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import Foundation

enum ServerApi:String {
    case ping
    case gameSchedules
    case liveDraw
    case previousDraws

    var gameID: String {
        return "1100"
    }
    
    var baseURL: String {
        return "https://api.opap.gr/"
    }
    
    var url: String {
        switch self {
        case .ping:
            return baseURL
        case .gameSchedules:
            return baseURL + "draws/v3.0/\(gameID)/upcoming/20"
        case .liveDraw:
            return "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution="
        case .previousDraws:
            let todayString = DateHandler().getDateStringFrom(date: Date(), format: .short)
            let sufix = "\(todayString)" + "/" + "\(todayString)"
            return baseURL + "draws/v3.0/\(gameID)/draw-date/" + sufix
        }
    }
}

