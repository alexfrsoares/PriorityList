//
//  TaskView.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import SwiftUI

struct TaskView: View {
    var task: Task

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(Color.blue)
                .opacity(0.1)
            HStack {
                Button(action: {
                    task.done.toggle()
                }, label: {
                    Image(systemName: getTaskStatusImage(done: task.done))
                        .resizable()
                        .tint(Color.black)
                        .frame(width: 22, height: 22)
                })
                Text(task.activity)
                    .foregroundStyle(Color.black)
                Spacer()
                if task.priority != 1 {
                    Image(systemName: getPriorityImage(priority: task.priority))
                        .tint(Color.black)
                }
            }
            .padding()
        }
    }

    private func getTaskStatusImage(done: Bool) -> String {
        var statusImage = ""

        if done {
            statusImage = "checkmark.square"
        } else {
            statusImage = "square"
        }

        return statusImage
    }

    private func getPriorityImage(priority: Int) -> String {
        var priorityImage = ""

        switch priority {
        case 0:
            priorityImage = "questionmark.diamond"
        case 2:
            priorityImage = "exclamationmark.triangle.fill"
        default:
            priorityImage = ""
        }

        return priorityImage
    }
}
