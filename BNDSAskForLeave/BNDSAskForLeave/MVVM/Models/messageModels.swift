//
//  messageModels.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

// 枚举定义保持不变
enum gradeType: Codable {
    case Grade10
    case Grade11
    case Grade12
}

// 修改 messageInfo 结构体
struct messageInfo: Identifiable, Codable {
    var id: UUID  // 移除默认值，避免解码问题
    var name: String
    var grade: gradeType
    var startDate: Date
    var endDate: Date
    var startClass: Int
    var endClass: Int
    var reason: String
    var teacher: String
    var askForLeaveTime: Date
    
    // 添加初始化器
    init(id: UUID = UUID(), // 在这里提供默认 UUID
         name: String,
         grade: gradeType,
         startDate: Date,
         endDate: Date,
         startClass: Int,
         endClass: Int,
         reason: String,
         teacher: String,
         askForLeaveTime: Date) {
        self.id = id
        self.name = name
        self.grade = grade
        self.startDate = startDate
        self.endDate = endDate
        self.startClass = startClass
        self.endClass = endClass
        self.reason = reason
        self.teacher = teacher
        self.askForLeaveTime = askForLeaveTime
    }
}




