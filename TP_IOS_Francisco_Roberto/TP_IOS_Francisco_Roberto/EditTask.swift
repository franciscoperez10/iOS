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
            TextField("Nome", text: $task.name)
            TextField("Descrição", text: $task.description)
            TextField("Categoria", text: $task.category)
            TextField("Imagem", text: $task.image)
        }			
        .navigationTitle("Editar Tarefa")
    }
}

#Preview {
    EditTaskView(task: .constant(Task(id: 1, name: "Teste", description: "ABC", category: "Cat", image: "team")))
}



