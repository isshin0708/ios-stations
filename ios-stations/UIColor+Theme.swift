import UIKit

extension UIColor {
    struct Theme {
        static var main: UIColor {
            return UIColor(named: "Main") ?? UIColor.systemPink
        }

        static var random: UIColor {
            return UIColor(
                red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1.0
            )
        }
    }
}
