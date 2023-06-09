//
//  AddTaskView.swift
//  Priority List
//
//  Created by Alex Freitas on 07/06/2023.
//

import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss

    @State var task: Task?
    @State var taskActivity: String = ""
    @State var taskPriority: Int = 0
    @State var editMode = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Task:")
                .padding(.top)
                .padding(.horizontal)
            TextField("Describe your task's activity here", text: $taskActivity)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            Text("Task priority:")
                .padding(.horizontal)
            Picker("Task priority:", selection: $taskPriority) {
                ForEach(0...2, id: \.self) { value in
                    Text(getPriorityString(value: value))
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            HStack {
                Spacer()
                Group {
                    Button {
                        if editMode {
                            updateTask()
                        } else {
                            addTask()
                        }
                        dismiss()
                    } label: {
                        if editMode {
                            Text("Confirm")
                                .frame(width: 66)
                        } else {
                            Text("Save")
                                .frame(width: 66)
                        }
                    }

                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                            .frame(width: 66)
                    }

                    if editMode {
                        Button {
                            if task != nil {
                                deleteTask(task!)
                            }
                            dismiss()
                        } label: {
                            Text("Delete")
                                .frame(width: 66)
                        }
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .padding(.vertical)
            Spacer()
        }
        .onAppear() {
            if let task = self.task {
                self.editMode = true
                self.getTaskValues(task: task)
            }
        }
    }

    private func getTaskValues(task: Task) {
        self.taskActivity = task.activity
        self.taskPriority = task.priority
    }

    private func getPriorityString(value: Int) -> String {
        var priorityDescription = ""

        switch value {
        case 0:
            priorityDescription = "Low"
        case 1:
            priorityDescription = "Default"
        case 2:
            priorityDescription = "High"
        default:
            priorityDescription = "Default"
        }

        return priorityDescription
    }

    private func addTask() {
        withAnimation {
            let newTask = Task(activity: taskActivity, priority: taskPriority)
            modelContext.insert(newTask)
        }
    }

    private func updateTask() {
        self.task?.activity = taskActivity
        self.task?.priority = taskPriority
    }

    private func deleteTask(_ task: Task) {
        modelContext.delete(task)
    }
}

#Preview {
    AddTaskView(taskActivity: "Entregar projetinho no github", taskPriority: 2)
}
