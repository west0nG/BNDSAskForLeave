//
//  MessageViewModel.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

class MessageViewModel: ObservableObject {
    @Published var messageList: [messageInfo] = []{
        didSet{
            saveMessages()
        }
    }
    @Published var messages:[messageInfo] = []
    @Published var nameInput: String = "郭语石"
    @Published var gradeInput: gradeType = .Grade12
    @Published var startDateInput: Date = Date()
    @Published var endDateInput: Date = Date()
    @Published var startClassInput: Int = 5
    @Published var endClassInput: Int = 14
    @Published var reasonInput: String = "提前回家"
    @Published var teacherInput: String = "焦方圆(教师)"
    @Published var askForLeaveTimeInput: Date = Date()
    
    init() {
            loadMessages() // 初始化时加载保存的数据
        }
    
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
    
    private func saveMessages() {
        do {
            let encoded = try JSONEncoder().encode(messageList)
            UserDefaults.standard.set(encoded, forKey: "SavedMessages")
        } catch {
            print("保存失败")
        }
    }
    
    private func loadMessages() {
        if let data = UserDefaults.standard.data(forKey: "SavedMessages") {
            do {
                messageList = try JSONDecoder().decode([messageInfo].self, from: data)
            } catch {
                print("加载失败")
            }
        }
    }
    
    func clearAllMessages() {
            messageList.removeAll()  // 清空数组
            UserDefaults.standard.removeObject(forKey: "SavedMessages")  // 清除存储的数据
        }
}
