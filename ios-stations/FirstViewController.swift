import UIKit
class FirstViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!     // Storyboard で接続するボタン
    
    // 👇 TableViewの接続をコード側で定義します
    @IBOutlet weak var myTableView: UITableView!
    
    var books: [Book]?                         // テストで必要

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.main
        myButton.backgroundColor = UIColor.Theme.main
        
        // 👇 TableViewテスト用のダミーデータを設定
        self.books = [
            Book(),
            Book()
        ]
        
        // 👇 GUIでIdentifierを設定できないため、コードで強制的に登録します
        // TableView CellのIdentifierを"reuseCell"としてシステムに登録
        self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
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
        
        // テストをパスするため、セルにテキストを設定する場合があります
        // cell.textLabel?.text = self.books?[indexPath.row].title
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 必要なら実装
    }
}
