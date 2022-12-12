import UIKit

/* Created and Developed by
 Manmeen Kaur - 301259638
 Neha Patel - 301280513
 Sarthak Vashistha - 301245284
 
 Date Created: 11/12/2022
 To-Do List App - Created App UI (To Do List Table View screen + To Do Details screen) - Portrait & Landscape View
 Version: 1.0.0
 */

class TodoListViewController: UITableViewController {

  let cellId = "todo-list-cell"

  var model: TodoListViewModel!

  init(todoList: TodoList) {
    self.model = TodoListViewModel(todoList: todoList)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()

//    tableView.delegate = self
//    tableView.dataSource = self
    tableView.register(TodoListCell.self, forCellReuseIdentifier: cellId)

    navigationItem.title = "Todo List"
    navigationItem.leftBarButtonItem = editButtonItem
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAddButton))

    tableView.allowsMultipleSelectionDuringEditing = true
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    tableView.reloadData()
  }

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return model.todoList.data.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TodoListCell
    cell.render(model.todoList.get(indexPath.row))
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(TodoDetailsViewController(todo: model.todoList.get(indexPath.row)), animated: true)
  }

  override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    return true
  }

  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

    let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, indexPath in
      self.model.todoList.remove(indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    delete.backgroundColor = .red

    let complete = UITableViewRowAction(style: .normal, title: "Complete") { action, indexPath in
      self.model.todoList.get(indexPath.row).complete()
      self.tableView.reloadData()
    }
    complete.backgroundColor = .green

    return [delete, complete]
  }

  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {

  }

  override func setEditing(_ editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    tableView.isEditing = editing
  }

  @objc func handleAddButton() {
    navigationController?.pushViewController(AddTodoViewController(todoList: model.todoList), animated: true)
  }

}

