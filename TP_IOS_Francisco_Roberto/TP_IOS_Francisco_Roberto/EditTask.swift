//
//  EditTask.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import SwiftUI

struct EditTaskView: View {
    @Binding var task: Task

    var body: some View {
        Form {
            Section(header: Text("Nome")) {
                TextField("Nome", text: $task.name)
            }
            Section(header: Text("Descrição")) {
                TextField("Descrição", text: $task.description)
            }
            Section(header: Text("Categoria")) {
                TextField("Categoria", text: $task.category)
            }
            Section(header: Text("Imagem")) {
                TextField("Imagem", text: $task.image)
            }
        }
        .navigationTitle("Editar Tarefa")
    }
}

#Preview {
    EditTaskView(task: .constant(Task(
        id: 10, name: "Teste", description: "ABC", category: "Finances", image: "PNG")))
}



