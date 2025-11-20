import UIKit
class FirstViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!      // Storyboard で接続するボタン
    
    // 👇 TableViewの接続をコード側で定義します
    @IBOutlet weak var myTableView: UITableView!
    
    var books: [Book]?                          // テストで必要

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Theme.main
        myButton.backgroundColor = UIColor.Theme.main
        
        // 👇 TableViewテスト用のダミーデータを設定
        self.books = [
            Book(),
            Book()
        ]
        
        // **【ここを削除/コメントアウトします】**
        // StoryboardでIdentifierを設定したため、コードでの登録は不要です。
        // self.myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
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
        // StoryboardでIdentifierを設定しているため、必ず取得できるはずです。
        // 強制アンラップ（as! UITableViewCell）は危険なため、ここではそのまま guard let を維持します。
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
