import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!   // Storyboard で接続するボタン
    var books: [Book]?                       // テストで必要

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.main
        myButton.backgroundColor = UIColor.Theme.main
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // ボタン背景色をランダムに変更
        sender.backgroundColor = UIColor.Theme.random
        // complete() は呼ばなくてOK
    }
}

// MARK: - UITableViewDataSource
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 必要なら実装
    }
}
