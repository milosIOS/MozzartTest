//
//  NumbersDrawViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit
import WebKit
protocol DrawNumbersView: BaseView {
    var selectedGame: SheduledGame! { get set }
}
class NumbersDrawViewController: UIViewController, DrawNumbersView {
    @IBOutlet weak var webView: WKWebView!
    var selectedGame: SheduledGame!
    var viewModel: ViewModelNumbersDraw!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
}

extension NumbersDrawViewController: UIViewStyling {
    func setupViews() {
        viewModel = ViewModelNumbersDraw(viewController: self)
        webView.allowsBackForwardNavigationGestures = true
        loadDrawWebView()
    }
    
    private func loadDrawWebView() {
        if APIManager.shared.isConnectedToInternet  {
            webView.load(URLRequest(url: viewModel.drawURL))
            
        } else {
            CustomAlertViewController(title: "Alert.Title.NoInternet".localized,
                                      message: "Alert.Message.NoInternet".localized,
                                      alertButtons: [AlertButton("Common.Ok".localized),
                                                     AlertButton("Common.Retry".localized, {[weak self] in
                                                        self?.loadDrawWebView()
                                                     })]).present()
        }
    }
}


extension NumbersDrawViewController: WKNavigationDelegate {
    
}
