//
//  EditTask.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task
    @Environment(\.dismiss) var dismiss
    @State private var selectedCategories: Categories = .strategy
    let images: [String] = ["negociação", "planeamento", "finances", "team", "product"]
    @State private var selectedImage: String? = nil

    enum Categories: String, CaseIterable, Identifiable {
        case strategy = "Strategy"
        case management = "Management"
        case finances = "Finances"
        case business = "Business"
        case product = "Product"
        
        var id: String { self.rawValue }
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Nome")) {
                    TextField("Nome", text: $task.name)
                }
                Section(header: Text("Descrição")) {
                    TextField("Descrição", text: $task.description)
                }
                Section(header: Text("Categoria")) {
                    Picker("Categoria", selection: $selectedCategories) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }
                Section(header: Text("Imagem")) {
                    TextField("Imagem", text: $task.image)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(images, id: \.self) { name in
                                Image(name)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 4)
                                            .stroke(selectedImage == name ? Color.blue : Color.gray, lineWidth: 2)
                                    )
                                    .onTapGesture {
                                        selectedImage = name
                                    }
                            }
                        }
                    }
                }
            }
            Button {
                task.category = selectedCategories.rawValue
                if let selected = selectedImage {
                    task.image = selected
                }
                dismiss()
            } label: {
                Text("Salvar")
            }
            .padding()
            
            
        }
        .navigationTitle("Editar Tarefa")
        .onAppear {
            
            selectedImage = task.image
            if let category = Categories(rawValue: task.category) {
                selectedCategories = category
            }
        }
    }
}

#Preview {
    EditTaskView(task: .constant(Task(
        id: 10, name: "Teste", description: "ABC", category: "Finances", image: "PNG")))
}

    
    
    
    
