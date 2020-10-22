//
//  ResultsViewController.swift
//  GrckiKino
//
//  Created by Milos Stevanovic on 10/22/20.
//

import UIKit

protocol ResultsView: BaseView { }
class ResultsViewController: UIViewController, ResultsView {
    @IBOutlet weak var resultsTable: UITableView!
    var viewModel: ViewModelResults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
    }
}

//MARK:- UIViewStyling
extension ResultsViewController: UIViewStyling {
    func setupViews() {
        resultsTable.estimatedRowHeight = 115
        resultsTable.rowHeight = UITableView.automaticDimension
        viewModel = ViewModelResults()
        viewModel.reloadTable = {[weak self] in
            self?.resultsTable.reloadData()
        }
        resultsTable.tableFooterView = UIView()
    }
}

extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfPreviousResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(ResultsTableCell.self, for: indexPath)
        cell.finishedGame = viewModel.arrayOfPreviousResults[indexPath.row]
        return cell
    }
    
}
