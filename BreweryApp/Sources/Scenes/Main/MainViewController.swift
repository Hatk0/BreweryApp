//
//  ViewController.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 29.03.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Coordinator
    
    weak var mainNavigationControllerCoordinator: MainViewControllerCoordinator?
    
    // MARK: - ViewModel
    
    var mainViewModel: MainViewModelProtocol?
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        fetchBreweries()
    }

    // MARK: - Setup
    
    private func fetchBreweries() {
        let mainViewModel = MainViewModel()
        mainViewModel.fetchBreweries { [weak self] result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self?.configure(with: mainViewModel)
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch breweries: \(error.localizedDescription)")
            }
        }
    }
    
    private func configure(with viewModel: MainViewModelProtocol) {
        mainViewModel = viewModel
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        title = "Brewery"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.frame = view.bounds
    }
}

// MARK: - Extensions

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainViewModel?.breweries.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let brewery = mainViewModel?.breweries[indexPath.row]
        cell.configure(with: brewery)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        mainNavigationControllerCoordinator?.runDetail()
    }
}
