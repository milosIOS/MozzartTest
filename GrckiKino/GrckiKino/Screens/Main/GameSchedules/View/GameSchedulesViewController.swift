//
//  GameSchedulesViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/21/20.
//

import UIKit

protocol GameSchedulesView: BaseView {
    var openGameScreen: ((_ selectedGame: SheduledGame?) -> Void)? { get set }
}

class GameSchedulesViewController: UIViewController, GameSchedulesView {
    var openGameScreen: ((SheduledGame?) -> Void)?

    @IBOutlet weak var tableView: UITableView!
    lazy var viewModel: GameSchedulesViewModel = {
        return GameSchedulesViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
    
    //TODO:- Set navigation in coordinators
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension GameSchedulesViewController: UIViewStyling {
    func setupViews() {
        viewModel = GameSchedulesViewModel()
        tableView.tableFooterView = UIView()
        viewModel.reloadTable = {[weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension GameSchedulesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfSchedules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(GameSchedulesTableCell.self, for: indexPath)
        cell.schedule = viewModel.arrayOfSchedules[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.openGameScreen?(viewModel.arrayOfSchedules[indexPath.row])
    }
}

extension GameSchedulesViewController: ReloadScheduledGamesDelegate {
    func reloadScheduledGames() {
        viewModel.getFirst20Games()
    }
}
