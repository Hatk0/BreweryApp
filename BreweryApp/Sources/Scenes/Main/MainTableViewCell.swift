//
//  MainTableViewCell.swift
//  BreweryApp
//
//  Created by Dmitry Yastrebov on 01.04.2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"
    
    // MARK: - UI
    
    private lazy var breweryNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(breweryNameLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            breweryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            breweryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        ])
    }
    
    // MARK: - Configuration
    
    func configure(with brewery: Brewery?) {
        breweryNameLabel.text = brewery?.name
    }
}
