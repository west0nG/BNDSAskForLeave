//
//  MessageViewModel.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var messages: [messageInfo] = []
    @Published var nameInput: String = "郭语石"
    @Published var gradeInput: gradeType = .Grade12
    @Published var startDateInput: Date = Date()
    @Published var endDateInput: Date = Date()
    @Published var startClassInput: Int = 5
    @Published var endClassInput: Int = 14
    @Published var reasonInput: String = "提前回家"
    @Published var teacherInput: String = "焦方圆(教师)"
    @Published var askForLeaveTimeInput: Date = Date()
    
    func addMessage() {
        let newMessage = messageInfo(
            name: nameInput,
            grade: gradeInput,
            startDate: startDateInput,
            endDate: endDateInput,
            startClass: startClassInput,
            endClass: endClassInput,
            reason: reasonInput,
            teacher: teacherInput,
            askForLeaveTime: askForLeaveTimeInput
        )
        messageList.append(newMessage)
    }
    
    func saveMessages() {
        if let encoded = try? JSONEncoder().encode(messageList) {
            UserDefaults.standard.set(encoded, forKey: "messageList")
        }
    }
    
    func loadMessages() {
        if let data = UserDefaults.standard.data(forKey: "messageList"),
           let decoded = try? JSONDecoder().decode([messageInfo].self, from: data) {
            messageList = decoded
        }
    }
}
