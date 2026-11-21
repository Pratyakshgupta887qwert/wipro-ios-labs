
# Lab 1E - Classes, Structs, ARC, and Memory

## Objective
To compare value and reference types and understand memory ownership using Automatic Reference Counting (ARC).

## Tasks Completed

### Task 1: Course Struct and CourseManager Class
- Created a `Course` structure with course name and credits.
- Created a `CourseManager` class to manage courses.
- Added and displayed course information.

### Task 2: Value and Reference Behaviour

**Struct Behaviour:**
- Created an original Course value.
- Copied it into another variable.
- Modified the copied value.
- Observed that the original value remained unchanged.

**Class Behaviour:**
- Created a CourseManager instance.
- Assigned its reference to another variable.
- Modified the object through the second variable.
- Observed that changes were visible through both variables.
- Used the identity operator (`===`) to verify that both variables refer to the same instance.

### Task 3: Teacher and Classroom
- Created two related reference types: `Teacher` and `Classroom`.
- Classroom strongly owns its teacher.
- Teacher maintains a weak reference to its classroom.
- Prevented a strong reference cycle using weak ownership.

### Task 4: Strong Reference Cycle
- Created a closure that strongly captures `self`.
- Demonstrated a strong reference cycle.
- Broke the cycle by setting the closure property to nil.
- Implemented a second closure using `[weak self]`.
- Prevented a retain cycle through a weak capture list.

### Task 5: Value/Reference Semantics and ARC

**Value Semantics:**
- Structs and enums are value types.
- Assigning a value produces an independent logical value.
- Changes to a copy do not affect the original.

**Reference Semantics:**
- Classes are reference types.
- Assigning a class instance copies its reference.
- Multiple variables can access the same object.

**Automatic Reference Counting (ARC):**
- ARC manages class instance lifetimes.
- Strong references keep instances alive.
- Instances are deallocated when their strong reference count reaches zero.

**Weak References:**
- Do not increase the strong reference count.
- Automatically become nil when the referenced object is deallocated.

**Unowned References:**
- Do not increase the strong reference count.
- Used when the referenced object is guaranteed to remain alive whenever accessed.

**Capture Lists:**
- `[weak self]` prevents a closure from strongly retaining its owner.
- Helps prevent strong reference cycles.

### Extension: Deinitialization
- Implemented `deinit` in class instances.
- Printed messages when objects were released.
- Observed ARC-managed object deallocation.

## Observations

1. Modifying a copied struct did not affect the original.
2. Two class variables referred to the same instance.
3. Weak references prevented circular ownership between Teacher and Classroom.
4. A closure strongly capturing self created a retain cycle.
5. Releasing the closure broke the cycle and allowed object deallocation.
6. Weak capture prevented the closure from retaining its owner.

## Project Structure

```text
lab-1e/
├── main.swift
└── README.md
```

## How to Run

Compile:

```bash
swiftc main.swift -o Lab1E
```

Execute:

```bash
./Lab1E
```

## Technologies
- Swift 6.4.2
- GitHub Codespaces

## Conclusion

This lab demonstrated the difference between value and reference semantics in Swift. It also explained ARC, strong and weak references, retain cycles, capture lists, and object deinitialization.
