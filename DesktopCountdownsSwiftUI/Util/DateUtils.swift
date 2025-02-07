//
//  DateUtils
//  DesktopCountdowns
//
//  Created by Dominik Pich on 6/27/20.
//

import Foundation

// MARK: daysBetween
extension Date {
  func daysBetween(_ date: Date?) -> Int {
    guard let date else {
      return 0
    }

    let calendar = Calendar.current
    let date1 = calendar.startOfDay(for: date)
    let date2 = calendar.startOfDay(for: self)
    let components = calendar.dateComponents([.day], from: date1, to: date2)
    return components.day ?? 0
  }
}

// MARK: string formatting
extension Date {
  private static var localDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.locale = Locale.current
    return dateFormatter
  }()
  private static var localDateTimeFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    dateFormatter.locale = Locale.current
    return dateFormatter
  }()

  func stringForCurrentLocale(includingTime: Bool = true) -> String {
    (includingTime ? Date.localDateTimeFormatter : Date.localDateFormatter).string(from: self)
  }
}
