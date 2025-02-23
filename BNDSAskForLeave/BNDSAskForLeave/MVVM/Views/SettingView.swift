//
//  SettingView.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//
import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var vm: MessageViewModel
    @AppStorage("messageList") private var messageListData: Data = Data()
    var body: some View {
        VStack(spacing:0){
            List{
                Section{
                    HStack{
                        Text("请假学生姓名")
                        Spacer()
                        TextField("请输入学生姓名", text: $vm.nameInput)
                            .opacity(0.45)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("请假学生年级")
                        Spacer()
                        Picker("",selection: $vm.gradeInput){
                            Text("Grade12").tag(gradeType.Grade12)
                            Text("Grade11").tag(gradeType.Grade11)
                            Text("Grade10").tag(gradeType.Grade10)
                        }
                        .labelsHidden()
                    }
                    HStack{
                        Text("请假开始日期")
                        Spacer()
                        DatePicker("选择日期",selection: $vm.startDateInput,displayedComponents: [.date])
                            .labelsHidden()
                    }
                    HStack{
                        Text("请假结束日期")
                        Spacer()
                        DatePicker("选择日期",selection: $vm.endDateInput,displayedComponents: [.date])
                            .labelsHidden()
                    }
                    HStack{
                        Text("请假开始课程")
                        Spacer()
                        Picker("",selection:$vm.startClassInput){
                            Text("第一节").tag(1)
                            Text("第二节").tag(2)
                            Text("第三节").tag(3)
                            Text("第四节").tag(4)
                            Text("第五节").tag(5)
                            Text("第六节").tag(6)
                            Text("第七节").tag(7)
                            Text("第八节").tag(8)
                            Text("第九节").tag(9)
                            Text("第十节(放学)").tag(10)
                            Text("第十一节(晚自习)").tag(11)
                            Text("第十二节").tag(12)
                            Text("第十三节").tag(13)
                            Text("第十四节(不住宿)").tag(14)
                        }
                        .labelsHidden()
                    }
                    HStack{
                        Text("请假结束课程")
                        Spacer()
                        Picker("",selection:$vm.endClassInput){
                            Text("第一节").tag(1)
                            Text("第二节").tag(2)
                            Text("第三节").tag(3)
                            Text("第四节").tag(4)
                            Text("第五节").tag(5)
                            Text("第六节").tag(6)
                            Text("第七节").tag(7)
                            Text("第八节").tag(8)
                            Text("第九节").tag(9)
                            Text("第十节(放学)").tag(10)
                            Text("第十一节(晚自习)").tag(11)
                            Text("第十二节").tag(12)
                            Text("第十三节").tag(13)
                            Text("第十四节(不住宿)").tag(14)
                        }
                        .labelsHidden()
                    }
                    HStack{
                        Text("请假原因")
                        Spacer()
                        TextField("请输入原因", text: $vm.reasonInput)
                            .opacity(0.45)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("执行教师")
                        Spacer()
                        TextField("请输入批准老师姓名", text: $vm.teacherInput)
                            .opacity(0.45)
                            .multilineTextAlignment(.trailing)
                    }
                    HStack{
                        Text("请假批准时间")
                        Spacer()
                        DatePicker("选择日期",selection: $vm.askForLeaveTimeInput)
                            .labelsHidden()
                    }
                    HStack{
                        Button{
                            vm.addMessage()
                        }label:{
                            Text("提交请假")
                        }
                    }
                    HStack{
                        Button{
                            vm.clearAllMessages()
                        }label:{
                            Text("清空请假记录")
                        }
                    }
                }
                Section{
                    HStack{
                        Section("历史记录") {
                            HStack{
                                if vm.messageList.isEmpty {
                                    Text("暂无记录")
                                        .foregroundColor(.gray)
                                } else {
                                    VStack{
                                        ForEach(vm.messageList) { message in
                                            Text(message.formatted())
                                            Text("")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
