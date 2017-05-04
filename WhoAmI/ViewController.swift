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

        let url = URL(string: "http://localhost:8000?redirect=SafariRedirect://")!
        safari = SFSafariViewController(url: url)

        addSafariController(safari)
    }

    func handleLogin(_ notification: Notification) {
        NotificationCenter.default.removeObserver(self, name: SafariRedirectNotification, object: nil)

        guard let url = notification.object as? URL else {
            return
        }
        guard let params = url.query?.characters.split(separator: "=").map(String.init) else {
            return
        }
        token = params[1]
        removeSafariController(safari)
    }

    func addSafariController(_ controller: SFSafariViewController?) {
        guard let controller = controller else {
            return
        }
        addChildViewController(controller)
        view.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
        controller.view.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
    }

    func removeSafariController(_ controller: SFSafariViewController?) {
        guard let controller = controller else {
            return
        }
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tokenCell
    }
}
