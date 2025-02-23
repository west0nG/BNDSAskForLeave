//
//  SettingView.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @State var nameInput: String = "郭语石"
    @State var gradeInput: gradeType = .Grade12
    @State var startDateInput: Date = Date()
    var body: some View {
        List{
            HStack{
                Text("请假学生姓名")
                TextField("请输入学生姓名", text: $nameInput)
                    .opacity(0.6)
            }
            HStack{
                Text("请假学生年级")
                Picker("",selection: $gradeInput){
                    Text("Grade12").tag(gradeType.Grade12)
                    Text("Grade11").tag(gradeType.Grade11)
                    Text("Grade10").tag(gradeType.Grade10)
                }
            }
            HStack{
                Text("请假开始日期")
                DatePicker("选择日期",selection: $startDateInput,displayedComponents: [.date])
                
            }
        }
    }
}

#Preview {
    SettingView()
}
