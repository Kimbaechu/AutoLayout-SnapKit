//
//  ViewController.swift
//  SnapKitPractice
//
//  Created by Beomcheol Kwon on 2021/01/01.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.backgroundColor = .systemBackground
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        createUI()
    }
    
    private func createUI() {
        self.navigationItem.title = "UIKit"
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return category.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category[section].boards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        cell.boardTitleLabel.text = category[indexPath.section].boards[indexPath.row].title
        cell.boardSubTitleLabel.text = category[indexPath.section].boards[indexPath.row].subTitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        headerView.backgroundColor = .systemBackground
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = category[section].name
        headerView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true

        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
        footerView.backgroundColor = .systemBackground
        let lineView = UIView()
        footerView.addSubview(lineView)
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .lightGray
        lineView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 20).isActive = true
        lineView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -20).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.centerYAnchor.constraint(equalTo: footerView.centerYAnchor, constant: 0).isActive = true

        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
}
