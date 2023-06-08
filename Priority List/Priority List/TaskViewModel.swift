//
//  TaskViewModel.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import Foundation
import Observation

@Observable class TaskViewModel {
    var activity: String = ""
    var priorityImage: String = ""
    var taskStatusImage: String = ""

    func setProperties(task: Task) {
        self.activity = task.activity
        setTaskStatusImage(done: task.done)
        setPriorityImage(priority: task.priority)
    }

    func setTaskStatusImage(done: Bool) {
        if done {
            self.taskStatusImage = "checkmark.square"
        } else {
            self.taskStatusImage = "square"
        }
    }

    private func setPriorityImage(priority: Int) {
        switch priority {
        case 0:
            self.priorityImage = "questionmark.diamond"
        case 2:
            self.priorityImage = "exclamationmark.triangle.fill"
        default:
            self.priorityImage = ""
        }
    }
}
