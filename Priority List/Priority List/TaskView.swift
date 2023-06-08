//
//  TaskView.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import SwiftUI
import Observation

struct TaskView: View {
    var task: Task
    var viewModel = TaskViewModel()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .foregroundStyle(Color.gray)
            HStack {
                Button(action: {
                    self.task.done.toggle()
                    self.viewModel.setTaskStatusImage(done: task.done)
                }, label: {
                    Image(systemName: self.viewModel.taskStatusImage)
                })
                Text(self.viewModel.activity)
                Spacer()
                Image(systemName: self.viewModel.priorityImage)
            }
            .padding()
        }
        .onAppear() {
            self.viewModel.setProperties(task: task)
        }
    }
}
