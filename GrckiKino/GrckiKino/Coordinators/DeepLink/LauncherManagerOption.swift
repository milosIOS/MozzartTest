//
//  LauncherManagerOption.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.


import Foundation

struct DeepLinkURLConstants {
    static let main = "main"
}

enum LauncerManagerOption {
    case main

static func build(with userActivity: NSUserActivity) -> LauncerManagerOption? {
    if userActivity.activityType == NSUserActivityTypeBrowsingWeb,
        let url = userActivity.webpageURL,
        let _ = URLComponents(url: url, resolvingAgainstBaseURL: true) {
        //TODO: extract string and match with DeepLinkURLConstants to jump
    }
    return nil
}
static func build(with dict: [String : AnyObject]?) -> LauncerManagerOption? {
    guard let id = dict?["launch_id"] as? String else { return nil }
    
    switch id {
    case DeepLinkURLConstants.main:         return .main
    default: return nil
    }
  }
}

