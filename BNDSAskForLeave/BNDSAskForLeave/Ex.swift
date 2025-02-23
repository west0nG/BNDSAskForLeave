//
//  Ex.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

extension messageInfo {
    func formatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let gradeString: String = {
            switch grade {
            case .Grade12:
                return "国际部高三Grade12"
            case .Grade11:
                return "国际部高二Grade11"
            case .Grade10:
                return "国际部高一Grade10"
            }
        }()
        
        return """
        请假学生：\(name)
        学生年级：\(gradeString)
        学生班级：高22级IB班
        开始：\(dateFormatter.string(from: startDate))第\(startClass)节
        结束：\(dateFormatter.string(from: endDate))第\(endClass)节
        请假类型：事假;离校;
        请假事由：\(reason)
        操作人：\(teacher)
        操作类型：批准请假
        """
    }
}

extension messageInfo {
    func getFormattedTime() -> String {
        let calendar = Calendar.current
        let now = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: askForLeaveTime)
        
        // 判断是否是今天
        if calendar.isDateInToday(askForLeaveTime) {
            return timeString
        }
        
        // 判断是否是昨天
        if calendar.isDateInYesterday(askForLeaveTime) {
            return "昨天 \(timeString)"
        }
        
        // 获取日期之间的天数差
        let components = calendar.dateComponents([.day], from: askForLeaveTime, to: now)
        let dayDifference = components.day ?? 0
        
        // 判断是否在本周内（7天以内）
        if dayDifference < 7 {
            let weekdayFormatter = DateFormatter()
            weekdayFormatter.locale = Locale(identifier: "zh_CN")
            weekdayFormatter.dateFormat = "EEEE"
            let weekday = weekdayFormatter.string(from: askForLeaveTime)
            return "\(weekday) \(timeString)"
        }
        
        // 更早的日期使用完整格式
        let fullFormatter = DateFormatter()
        fullFormatter.dateFormat = "yyyy年M月d日 HH:mm"
        return fullFormatter.string(from: askForLeaveTime)
    }
}

