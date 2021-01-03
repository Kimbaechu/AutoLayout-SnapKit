//
//  ThenTableViewCell.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/03.
//

import Foundation
import SnapKit
import Then

class ThenTableViewCell: UITableViewCell {
    
    static let identifier = "ThenTableViewCell"
    
    let pinButton = UIButton().then {
        $0.setImage(UIImage(systemName: "pin"), for: .normal)
        $0.tintColor = .darkGray
    }
    
    let boardTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 17)
    }
    
    let boardSubTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .darkGray
    }
    
    lazy var stackView = UIStackView(arrangedSubviews: [boardTitleLabel, boardSubTitleLabel]).then {
        $0.axis = .vertical
        $0.spacing = 0
    }
    
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
        
        pinButton.snp.makeConstraints {
            $0.top.left.bottom.equalTo(contentView).inset(UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 0))
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalTo(pinButton.snp.right).offset(20)
            $0.centerY.equalTo(pinButton)
        }
    }
}
