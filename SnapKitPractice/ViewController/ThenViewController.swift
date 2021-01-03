//
//  ThenViewController.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/03.
//

import Foundation
import SnapKit
import Then

class ThenViewController: UIViewController {
    
    let category: [Category] = [
        Category(name: "관심있는 글", boards: [
            Board(title: "내가 쓴 글", subTitle: nil, isFavorite: false),
            Board(title: "댓글 단 글", subTitle: nil, isFavorite: false),
            Board(title: "스크랩 한 글", subTitle: nil, isFavorite: false)
        ]),
        Category(name: "정보", boards: [
            Board(title: "정보, 질문", subTitle: "각종 정보 및 질문 게시판", isFavorite: false),
            Board(title: "자유게시판", subTitle: nil, isFavorite: false),
            Board(title: "취업, 진로", subTitle: "취업, 창업, 진로 게시판", isFavorite: false),
            Board(title: "공시생", subTitle: "5/7/9급 공무원 준비생 게시판", isFavorite: false),
        ]),
        Category(name: "홍보", boards: [
            Board(title: "홍보게시판", subTitle: nil, isFavorite: false),
            Board(title: "동아리", subTitle: nil, isFavorite: false)
        ])
    ]
    
    private let tableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.backgroundColor = .systemBackground
        $0.register(ThenTableViewCell.self, forCellReuseIdentifier: ThenTableViewCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        createUI()
    }
    
    private func createUI() {
        self.navigationItem.title = "Then"
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(view)
        }
    }
}

extension ThenViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category[section].boards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThenTableViewCell.identifier, for: indexPath) as! ThenTableViewCell
        
        cell.boardTitleLabel.text = category[indexPath.section].boards[indexPath.row].title
        cell.boardSubTitleLabel.text = category[indexPath.section].boards[indexPath.row].subTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60)).then {
            $0.backgroundColor = .systemBackground
        }
     
        let label = UILabel().then {
            $0.font = .boldSystemFont(ofSize: 24)
            $0.text = category[section].name
        }
        
        headerView.addSubview(label)
        
        label.snp.makeConstraints {
            $0.left.equalTo(headerView.snp.left).offset(20)
            $0.centerY.equalTo(headerView)
        }
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20)).then {
            $0.backgroundColor = .systemBackground
        }
        
        let lineView = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        footerView.addSubview(lineView)
        
        lineView.snp.makeConstraints {
            $0.left.right.equalTo(footerView).inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
            $0.height.equalTo(1)
            $0.centerY.equalTo(footerView)
        }

        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}
