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
    private var isFetching: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Refreshing contacts ...")
        self.tableView.refreshControl?.addTarget(self, action: #selector(refreshUserContacts(_:)), for: .valueChanged)
        self.tableView.refreshControl?.tintColor = UIColor(red: 0.25, green: 0.72, blue: 0.85, alpha: 1.0)
        fetchUserContacts(with: .SwiftyJson)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? UserContactTableViewCell else { return UITableViewCell() }
        let user = users[indexPath.row]
        cell.initialsLabel.text = "AB"
        cell.nameLabel.text = user.name
        cell.emailLabel.text = user.email
        cell.phoneNumberLabel.text = user.phone
        return cell
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
    
    @objc private func refreshUserContacts(_ sender: Any) {
        fetchUserContacts(with: .SwiftyJson)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
