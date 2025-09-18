//
//  TasksList.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

import Foundation

class TasksList{
    var allTasks: [Task] = []
    
    init() {
        decodeJSONData()
    }
    
    func decodeJSONData() {
        if let url = Bundle.main.url(forResource: "tasks", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                allTasks = try decoder.decode([Task].self, from: data)
                
                print(allTasks.count)
            }catch{
                print("Error decoding Json data: \(error)")
            }
        }
    }
    
    func addTask(_ task: Task){
        allTasks.append(task)
    }
    
    func deleteTask(at index: Int){
        allTasks.remove(at: index)
    }
}
