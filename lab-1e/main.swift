import Foundation
struct Course {
    var name: String
    var credits: Int
}
// CourseManager is a reference type
class CourseManager {
    var managerName: String
    var courses: [Course] = []
    init(managerName: String) {
        self.managerName = managerName
        print("CourseManager '\(managerName)' created.")
    }
    func addCourse(_ course: Course) {
        courses.append(course)
    }
    func displayCourses() {
        print("Manager: \(managerName)")

        for course in courses {
            print("Course: \(course.name), Credits: \(course.credits)")
        }
    }

    deinit {
        print("CourseManager '\(managerName)' released.")
    }
}

let swiftCourse = Course(name: "Swift Programming", credits: 4)
let courseManager = CourseManager(managerName: "Main Manager")
courseManager.addCourse(swiftCourse)

courseManager.displayCourses()
print("\n========== TASK 2: VALUE VS REFERENCE ==========")
print("\n--- Struct Copy Behaviour ---")

var originalCourse = Course(name: "Java", credits: 3)

var copiedCourse = originalCourse

// Modify the copied value
copiedCourse.name = "Python"
copiedCourse.credits = 5

print("Original Course: \(originalCourse.name)")
print("Original Credits: \(originalCourse.credits)")

print("Copied Course: \(copiedCourse.name)")
print("Copied Credits: \(copiedCourse.credits)")

// CLASS REFERENCE COPY
print("\n--- Class Reference Behaviour ---")

let manager1 = CourseManager(managerName: "Manager One")
manager1.addCourse(Course(name: "Java", credits: 3))

// Copies the reference, not the object
let manager2 = manager1

// Modify through the second reference
manager2.managerName = "Updated Manager"
manager2.addCourse(Course(name: "Python", credits: 4))

print("Manager 1 name: \(manager1.managerName)")
print("Manager 2 name: \(manager2.managerName)")

print("Manager 1 course count: \(manager1.courses.count)")
print("Manager 2 course count: \(manager2.courses.count)")

print("Both refer to the same object: \(manager1 === manager2)")
//3 task
print("\n========== TASK 3: WEAK REFERENCES ==========")

class Teacher {
    let name: String
    weak var classroom: Classroom?

    init(name: String) {
        self.name = name
        print("Teacher \(name) created.")
    }

    deinit {
        print("Teacher \(name) released.")
    }
}
class Classroom {
    let roomNumber: String

    // Classroom strongly owns its teacher
    let teacher: Teacher

    init(roomNumber: String, teacher: Teacher) {
        self.roomNumber = roomNumber
        self.teacher = teacher
        print("Classroom \(roomNumber) created.")
    }

    deinit {
        print("Classroom \(roomNumber) released.")
    }
}

func demonstrateWeakReference() {
    let teacher = Teacher(name: "Mr. Sharma")
    let classroom = Classroom(
        roomNumber: "A101",
        teacher: teacher
    )

    // Teacher refers back to Classroom weakly
    teacher.classroom = classroom

    print("Teacher: \(teacher.name)")
    print("Classroom: \(classroom.roomNumber)")

    if let assignedClassroom = teacher.classroom {
        print("Teacher is assigned to room: \(assignedClassroom.roomNumber)")
    }
}

demonstrateWeakReference()
//task-4
print("\n========== TASK 4: STRONG REFERENCE CYCLE ==========")

class ClosureDemo {
    let name: String
    var completion: (() -> Void)?

    init(name: String) {
        self.name = name
        print("\(name) object created.")
    }
    // This creates a strong reference cycle
    func createStrongCycle() {
        completion = {
            print("Strong closure called by \(self.name)")
        }
    }
    // Break the cycle by releasing the closure
    func breakStrongCycle() {
        completion = nil
        print("Strong reference cycle broken.")
    }
    // Correct solution: weak capture
    func createWeakCapture() {
        completion = { [weak self] in
            guard let self = self else {
                print("Object is no longer available.")
                return
            }
            print("Weak closure called by \(self.name)")
        }
    }
    deinit {
        print("\(name) object released.")
    }
}
// Demonstrate strong cycle and explicitly break it
do {
    var demo: ClosureDemo? = ClosureDemo(name: "StrongCycleDemo")

    demo?.createStrongCycle()
    demo?.completion?()
    // Remove the closure's strong reference to self
    demo?.breakStrongCycle()
    // Now ARC can release the object
    demo = nil
}
// Demonstrate the weak capture solution
do {
    let demo = ClosureDemo(name: "WeakCaptureDemo")

    demo.createWeakCapture()
    demo.completion?()
}
//task-5
print("\n========== TASK 5: MEMORY CONCEPTS ==========")

print("""
VALUE TYPES:
- Structs and enums are value types.
- Assigning a value creates an independent logical value.
- Changing a copy does not change the original.

REFERENCE TYPES:
- Classes are reference types.
- Assigning a class variable copies its reference.
- Multiple variables can refer to the same instance.

AUTOMATIC REFERENCE COUNTING (ARC):
- ARC manages the lifetime of class instances.
- Strong references keep objects alive.
- Objects are deallocated when no strong references remain.

WEAK REFERENCES:
- Do not increase the strong reference count.
- Automatically become nil when the object is deallocated.
- Must be declared optional.

UNOWNED REFERENCES:
- Do not increase the strong reference count.
- Used when the referenced object is guaranteed to outlive the reference.
- Accessing an unowned reference after deallocation causes a runtime failure.

CAPTURE LIST:
- [weak self] prevents a closure from strongly retaining its owner.
- It helps prevent strong reference cycles.
""")
