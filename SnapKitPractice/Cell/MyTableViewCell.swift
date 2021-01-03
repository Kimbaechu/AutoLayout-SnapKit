//
//  MyTableViewCell.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/02.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    let pinButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pin"), for: .normal)
        button.tintColor = .darkGray
        
        return button
    }()
    
    let boardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17)
        
        return label
    }()
    
    let boardSubTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [boardTitleLabel, boardSubTitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func createUI() {
        contentView.addSubview(pinButton)
        contentView.addSubview(stackView)
        
        pinButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        pinButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        pinButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: pinButton.trailingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: pinButton.centerYAnchor).isActive = true
    }
}
