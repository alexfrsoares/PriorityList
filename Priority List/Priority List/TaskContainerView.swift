//
//  TaskContainerView.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import SwiftUI
import SwiftData

struct TaskContainerView: View {
    @Query private var tasks: [Task]
    @State private var showingAddTaskView = false

    var body: some View {
        Button(action: {
            showingAddTaskView.toggle()
        }, label: {
            Text("Add task")
        })
        .sheet(isPresented: $showingAddTaskView) {
            AddTaskView()
        }
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(tasks) { task in
                    NavigationLink {
                        AddTaskView(task: task)
                    } label: {
//                        Text("\(task.activity)")
                        TaskView(task: task)
//                            .scaledToFit()
                            .frame(height: 40)
                            .padding()
                    }
                }
            }
        }
    }
}
