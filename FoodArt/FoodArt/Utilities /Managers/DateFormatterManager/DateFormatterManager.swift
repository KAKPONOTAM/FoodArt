import Foundation

struct DateFormatterManager {
    static private let dateFormatter = DateFormatter()
    private init() {}
}

extension DateFormatterManager {
    static func string(from date: Date, to format: DateFormates, dateStyle: DateFormatter.Style = .none, localization: Localization = .russianLocale) -> String {
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.locale = Locale(identifier: localization.rawValue)
        
        return dateFormatter.string(from: date)
    }
    
    static func date(from: String, dateStyle: DateFormatter.Style = .none, format: DateFormates? = .none) -> Date? {
        if let format {
            dateFormatter.dateFormat = format.rawValue
        }
        
        return dateFormatter.date(from: from)
    }
}

extension DateFormatterManager {
    public enum DateFormates: String {
       case d_MMMM_yyyy = "d MMMM, yyyy"
    }
    
    public enum Localization: String {
        case russianLocale = "ru_RU"
    }
}
