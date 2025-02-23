//
//  ContentView.swift
//  BNDSAskForLeave
//
//  Created by weston on 2025/2/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MessageViewModel()
    var body: some View {
        NavigationStack{
            VStack(spacing:10) {
                NavigationLink(destination: FakeView()){
                    Text("请假页面")
                }
                NavigationLink(destination: SettingView()){
                    Text("输入请假详情")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(MessageViewModel())
}
