//
//  TaskDetail.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct TaskDetail: View {
    
    var task : Task
    @Binding var taskBinding: Task
    func onDelete: ()
    
    var body: some View {
        
        VStack{
            
            Text(task.category)
                .padding()
                .multilineTextAlignment(.center)
            
            ZStack{
                Image(task.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .offset(y:50)
                    .clipped()
                    .clipShape(.circle)
                    .overlay(Circle().stroke(Color.white,lineWidth:  4))
                    .padding()
            }
            
            
            Text(task.name)
                .font(.title3)
                .fontWeight(.bold)
            
            Text(task.description)
                .padding()
                .multilineTextAlignment(.center)
            
        }
        Spacer()
        
        HStack{
            Spacer()
            NavigationLink(destination: EditTaskView(task: $taskBinding)){
               Image(systemName: "square.and.pencil")
                    .font(.system(size: 25))
            }
                        
            Spacer()
            
            Button{
            
            }label:{
                onDelete()
                Image(systemName: "trash")
                    .font(.system(size: 25))
            }
            Spacer()
        }
        
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    TaskDetail(task: TasksList().allTasks[0], taskBinding: .constant(TasksList().allTasks[0]))
}


