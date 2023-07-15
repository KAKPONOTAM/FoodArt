import UIKit

extension UILabel {
    func changeInNeedRangeColor (fullText: String , changeText: String) {
        let nsString: NSString = fullText as NSString
        let range = nsString.range(of: changeText)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(.customLightGray) ?? .red , range: range)
        self.attributedText = attributedString
    }
}
