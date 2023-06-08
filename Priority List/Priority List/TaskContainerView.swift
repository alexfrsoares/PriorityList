//
//  TaskContainerView.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import SwiftUI
import SwiftData

struct TaskContainerView: View {
//    @Environment(\.modelContext) private var modelContest
    @Query private var tasks: [Task]
    @State private var showingAddTaskView = false

    var body: some View {
        Button(action: {
            showingAddTaskView.toggle()
        }, label: {
            Text("New task")
        })
        .sheet(isPresented: $showingAddTaskView) {
            AddTaskView()
        }
        NavigationView {
            List {
                ForEach(tasks) { task in
                    NavigationLink {
                        AddTaskView(task: task)
                    } label: {
                        Text("\(task.activity)")
                    }
                }
            }
        }
    }
}

#Preview {
    TaskContainerView()
}
