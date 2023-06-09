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
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(tasks) { task in
                    NavigationLink {
                        AddTaskView(task: task)
                    } label: {
                        TaskView(task: task)
                            .frame(height: 40)
                            .padding()
                    }
                }
            }
        }
        Spacer()
        Button(action: {
            showingAddTaskView.toggle()
        }, label: {
            Text("Add task")
        })
        .sheet(isPresented: $showingAddTaskView) {
            AddTaskView()
        }
    }
}
