//
//  ContentView.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State var tasks = TasksList().allTasks
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($tasks) { $task in
                    NavigationLink {
                        TaskDetail(task: task, taskBinding: $task)
                    } label: {
                        HStack {
                            Image(task.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .shadow(color:.white, radius: 1)
                            Text(task.name)
                        }
                    }
                }
            }
            .navigationTitle("Tasks")
            
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 25))
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                        .font(.system(size: 25))
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}


#Preview {
    ContentView()
}
