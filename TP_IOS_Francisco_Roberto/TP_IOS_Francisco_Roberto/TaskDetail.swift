//
//  TaskDetail.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct TaskDetail: View {
    
    let task : Task
    
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
            Button{
            
            }label:{
                Image(systemName: "square.and.pencil")
                    .font(.system(size: 25))
            }
                        
            Spacer()
            
            Button{
            
            }label:{
                Image(systemName: "trash")
                    .font(.system(size: 25))
            }
            Spacer()
        }
        
        .preferredColorScheme(.dark)
        
    }
}

#Preview {

    TaskDetail(task:
        TasksList().allTasks[0])

}

