import UIKit

/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created App UI (To Do List Table View screen + To Do Details screen) - Portrait & Landscape View
 Version: 1.0.0
 */

class AddTodoViewController: UIViewController {

  var model: AddTodoViewModel!

  init(todoList: TodoList) {
    self.model = AddTodoViewModel(todoList: todoList)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func loadView() {
    self.view = AddTodoView(self)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.title = "Add Todo"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
  }

  @objc func handleDoneButton() {
    guard let title = (view as! AddTodoView).titleField.text else { return }
    model.done(title: title)
    print(parent)
    navigationController?.popViewController(animated: true)
  }

}
