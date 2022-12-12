import Foundation

/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created App UI (To Do List Table View screen + To Do Details screen) - Portrait & Landscape View
 Version: 1.0.0
 */

class Todo {

  var title: String
  var description: String
  var priority: Int
  var isCompleted: Bool

  init(title: String, description: String = "", priority: Int = 100, isCompleted: Bool = false) {
    self.title = title
    self.description = description
    self.priority = priority
    self.isCompleted = isCompleted
  }

  func complete() {
    isCompleted = true
  }

}
