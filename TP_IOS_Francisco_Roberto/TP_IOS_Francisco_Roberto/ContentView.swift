//
//  ContentView.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State var tasks = TasksList().allTasks
    @State var buttonClicked = false
    @State var authorButton = false
    
    
    
    func deleteTasks(taskToDelete: Task) {
        if let index = tasks.firstIndex(where: { task in task.id == taskToDelete.id    })
        {tasks.remove(at: index)
        }
    }
    
    func deleteAllTasks() {
        tasks.removeAll()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("permanentBackground")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                VStack {
                    List {
                        ForEach($tasks) { $task in
                            NavigationLink (
                                destination: TaskDetail(
                                    task: task,
                                    taskBinding: $task,
                                    onDelete: { deleteTasks(taskToDelete: task) }
                                )
                                
                            ) {
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
                    } .padding()
                    .navigationTitle("Tasks")
                    .scrollContentBackground(.hidden)
                    
                    HStack {
                        Spacer()
                        Button {
                            buttonClicked.toggle()
                            
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 25))
                        }
                        
                        Spacer()
                        
                        
                        
                        Button {
                            authorButton.toggle()
                    

                        } label: {
                            Image(systemName: "info.circle")
                                .font(.system(size: 25))
                        }
                        .sheet(isPresented: $authorButton) {
                            AuthorsView()
                        }
                        
                        
                        Spacer()
                        Button {
                            deleteAllTasks()
                        } label: {
                            Image(systemName: "trash")
                                .font(.system(size: 25))
                        }
                        Spacer()
                    }
                    
                    .sheet(isPresented: $buttonClicked) {
                        AddTaskView(tasks: $tasks)
                    }
                    
                }
                .preferredColorScheme(.dark)
            }
        }
    }
}


#Preview {
    ContentView()
}
