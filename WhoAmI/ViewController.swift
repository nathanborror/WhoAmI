//
//  ViewController.swift
//

import UIKit
import SafariServices

class ViewController: UITableViewController {

    let tokenCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
    var safari: SFSafariViewController?

    var token = "" {
        didSet {
            tokenCell.detailTextLabel?.text = token
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 54
        tokenCell.textLabel?.text = "Cookie Token"
        loginAttempt()
    }

    func loginAttempt() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogin), name: SafariRedirectNotification, object: nil)

        let url = URL(string: "http://localhost:8000/?redirect=whoami://")!
        safari = SFSafariViewController(url: url)
        present(safari!, animated: true, completion: nil)
    }

    func handleLogin(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: SafariRedirectNotification, object: nil)
        safari?.dismiss(animated: true, completion: nil)

        guard let url = notification.object as? URL else {
            return
        }
        guard let params = url.query?.characters.split(separator: "=").map(String.init) else {
            return
        }
        guard params.count > 1 else {
            return
        }
        token = params[1]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tokenCell
    }
}
