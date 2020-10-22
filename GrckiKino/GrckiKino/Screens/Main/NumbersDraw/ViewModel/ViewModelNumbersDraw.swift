//
//  ViewModelNumbersDraw.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/26/20.
//

import Foundation
import UIKit
class ViewModelNumbersDraw {
    
    private enum Constants {
        static let webviewDrawURL = ServerApi.liveDraw.url
        static let webViewEscapeGoatURL = "https://www.google.com/"
    }
    
    //TODO:- Should be delegate or protocol.
    private weak var viewController: NumbersDrawViewController!
    
    init(viewController: NumbersDrawViewController) {
        self.viewController = viewController
    }
    
    private var resolution: String {
        return getDeviceResolution()
    }
    var drawURL: URL {
        guard let url = URL(string: Constants.webviewDrawURL + "\(resolution)") else { return URL(string: Constants.webViewEscapeGoatURL)!}
        return url
    }
    
    
    private func getDeviceResolution() -> String {
        let scrolleFactor = UIScreen.main.scale
        let webViewBounds = viewController.webView.bounds
        let screenWidth = webViewBounds.width * scrolleFactor
        let screenHeight = (webViewBounds.height - (viewController.navigationController?.navigationBar.frame.height ?? CGFloat(0)) - (viewController.tabBarController?.tabBar.frame.height ?? CGFloat(0))) * scrolleFactor
        let resolution = "\(screenWidth)x\(screenHeight)"
        return resolution
    }
}
