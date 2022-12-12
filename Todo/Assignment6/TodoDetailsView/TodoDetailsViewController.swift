import UIKit
/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created App UI (To Do List Table View screen + To Do Details screen) - Portrait & Landscape View
 Version: 1.0.0
 */

class TodoDetailsViewController: UIViewController {

  var model: TodoDetailsViewModel!

  init(todo: Todo) {
    self.model = TodoDetailsViewModel(todo: todo)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func loadView() {
    self.view = TodoDetailsView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = model.todo.title
  }
    
}
