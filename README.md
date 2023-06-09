# PriorityList
A SwiftData Experimentation

I made this little project specifically to try out SwiftData.
Please note that I wasn't overly concerned with layout or user experience or that this app served a valid purpose.

The project contains the following files:

- Priority_ListApp: imports SwiftUI and SwiftData frameworks. modelContainer tells SwiftData which model needs to be created or accessed in the database when the application starts.
- TaskContainerView: imports SwiftUI and SwiftData frameworks. @Query allows us to make requests to save, search, edit and remove persistence data.
- Task: is the @Model. It imports SwiftUI and SwiftData frameworks.
- TaskView: imports the SwiftUI framework. Everything that is done here (in the Task) is reflected in the database.
- AddTaskView: imports SwiftUI and SwiftData frameworks. modelContext allows us to add new tasks and remove tasks from database. Task updates do not need to declare modelContext (like in TaskView).

This explanation is what I understood of this new framework so far.
I will probably need some updates and fixes soon.

PS: Xcode 15.0+ Beta required.
