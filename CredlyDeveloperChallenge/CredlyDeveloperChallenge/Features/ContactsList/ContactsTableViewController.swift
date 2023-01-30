//
//  ContactsTableViewController.swift
//  CredlyDeveloperChallenge
//
//  Created by Michael Sweeney on 1/26/23.
//

import UIKit

private enum DataFetchType {
    case SwiftyJson
    case Decodable
}

class ContactsTableViewController: UITableViewController {

    private var users = [UserContact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing contacts ...")
        tableView.refreshControl?.addTarget(self, action: #selector(refreshUserContacts(_:)), for: .valueChanged)
        tableView.refreshControl?.tintColor = UIColor.white
        fetchUserContacts(with: .SwiftyJson)
    }
    
    private func fetchUserContacts(with: DataFetchType) {
        
        switch with {
        case .SwiftyJson:
            API.getSwfityUsers { users in
                self.users = users
                DispatchQueue.main.async {
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            }
        case .Decodable:
            API.getUsers { users in
                self.users = users
                DispatchQueue.main.async {
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? UserContactTableViewCell else { return UITableViewCell() }
        let user = users[indexPath.row]
        cell.initialsLabel.text = user.initials
        cell.nameLabel.text = user.name
        if let formattedName = user.formattedName {
            cell.nameLabel.text = formattedName
        }
        cell.emailLabel.text = user.email
        cell.phoneNumberLabel.text = user.formattedPhone
        if indexPath.row % 2 == 0 {
            cell.initialsLabel.backgroundColor = Color.primaryHighlight

        }
        
        return cell
    }
    
    @objc private func refreshUserContacts(_ sender: Any) {
        fetchUserContacts(with: .SwiftyJson)
    }

}
