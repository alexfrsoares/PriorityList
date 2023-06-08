//
//  TaskDataManager.swift
//  Priority List
//
//  Created by Alex Freitas on 08/06/2023.
//

import SwiftUI
import SwiftData

struct TaskDataManager {
    @Environment(\.modelContext) private var modelContext
    @Query private var task: [Task]

    func addTask(task: Task) {
        modelContext.insert(task)
    }

    func updateTask(task: Task, offsets: IndexSet) {

    }

    func deleteTasks(tasks: [Task], offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}
