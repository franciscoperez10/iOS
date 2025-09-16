//
//  Tasks.swift
//  TP_IOS_Francisco_Roberto
//
//  Created by MultiLab PRT 07 on 16/09/2025.
//

struct Task : Decodable, Identifiable{
    let id: Int
    var name: String
    var description: String
    var category: String
    var image: String
}
