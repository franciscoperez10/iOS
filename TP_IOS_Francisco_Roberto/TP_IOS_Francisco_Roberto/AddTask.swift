//
//  AddTask.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct AddTaskView: View {
    @Binding var tasks: [Task]
    @Environment(\.dismiss) var dismiss
    
    @State private var id: Int = 0
    @State private var newTaskName: String = ""
    @State private var newTaskDescription: String = ""
    @State private var category : String = ""
    @State private var newImage = String("")
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome", text: $newTaskName)
                TextField("Descrição", text: $newTaskDescription)
                TextField("Categoria", text: $category)
                TextField("Imagem", text: $newImage)
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newTask = Task(id: tasks.count  + 1 , name: newTaskName, description: newTaskDescription, category: category, image: newImage)
                        tasks.append(newTask)
                        dismiss()		
                    }
                    
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        
    }
}
        
