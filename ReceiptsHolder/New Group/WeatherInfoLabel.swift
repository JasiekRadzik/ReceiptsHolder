import Foundation
import UIKit

class WeatherInfoLabel: UILabel {

    init(infoType: String, infoData: String) {
        super.init(frame: .zero)
        let formattedString = NSMutableAttributedString()
        let boldFontAttribute = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18.0)]
        formattedString.append(NSAttributedString(string: infoType + ": ", attributes: boldFontAttribute))
        let normalFontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18.0)]
        formattedString.append(NSAttributedString(string: infoData, attributes: normalFontAttribute))
        attributedText = formattedString
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
