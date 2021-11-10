//
//  ViewController.swift
//  viagens_swift
//
//  Created by Igor Sthaynny on 10/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
    


}


extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Viagem \(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as! HomeTableViewHeader
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
}