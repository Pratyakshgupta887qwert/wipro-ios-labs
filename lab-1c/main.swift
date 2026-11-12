import Foundation
var courses = ["swift","java","python","javascript"]
print("courses:  \(courses)")
//add course
courses.append("c#")
print("courses after adding:  \(courses)")

//imp
//remove course
if let index = courses.firstIndex(of: "java") {
    courses.remove(at: index)
}
print("courses after removing: \(courses)")

//sort
courses.sort()
print("courses after sort: \(courses)")

//filter
let filteredCourses = courses.filter {
    $0.localizedCaseInsensitiveContains("a")
}
print("Courses containing 'a': \(filteredCourses)")


//search
let searchCourse = "Swift"
if courses.contains(searchCourse) {
    print("\(searchCourse) course found!")
} else {
    print("\(searchCourse) course not found!")
}