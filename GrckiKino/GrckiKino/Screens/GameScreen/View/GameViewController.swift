//
//  GameViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit

protocol GameView: BaseView {
    var onGoBack: (() -> Void)? { get set }
}
class GameViewController: UIViewController, GameView {
    var onGoBack: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @IBAction func goBackAction(_ sender: UIBarButtonItem) {
        onGoBack?()
    }
}

extension GameViewController: UIViewStyling {
    func setupViews() {
        self.navigationController?.isNavigationBarHidden = false
    }
}
