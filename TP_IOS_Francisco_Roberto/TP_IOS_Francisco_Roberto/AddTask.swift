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
    @State private var selectedCategories: Categories = .strategy
    
    enum Categories: String, CaseIterable, Identifiable {
        case strategy = "Strategy"
        case management = "Management"
        case finances = "Finances"
        case business = "Business"
        case product = "Product"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("")){
                    TextField("Nome", text: $newTaskName)}
                Section(header: Text("")){
                    TextField("Descrição", text: $newTaskDescription)}
                Section(header: Text("Categoria")) {
                    Picker("Categoria", selection: $selectedCategories) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
                Section(header: Text("")){
                    TextField("Imagem", text: $newImage)}
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
        
