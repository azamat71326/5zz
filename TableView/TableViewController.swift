//  TableViewController.swift
//  TableView
//
//  Created by Азамат Кубаев on 24.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayPersons = [Person(name: "Cэм", surname: "Уортингтон" , imagename: "аватар1"),
                        Person(name: "Зои", surname: "Салдана", imagename: "аватар2"),
                        Person(name: "Стивен", surname: "Ленг", imagename: "аватар3"),
                        Person(name: "Сигурни", surname: "Уивер", imagename: "аватар4")]
    
    class Person {
        var name: String
        var surname: String
        var imagename: String
        var updateDate: Date

        init(name: String, surname: String, imagename: String) {
            self.name = name
            self.surname = surname
            self.imagename = imagename
            self.updateDate = Date()
        }
    }
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    
    func startTimer() {
        // Создаем таймер, который будет выполняться каждые 2 секунды
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTable), userInfo: nil, repeats: true)
    }
    deinit {
        // Очистка таймера при уничтожении контроллера
        timer?.invalidate()
        timer = nil
    }
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
    @objc func updateTable() {
        // Добавляем новый элемент с текущей датой
        let newPerson = TableViewController.Person(name: "Новое имя", surname: "Новая фамилия", imagename: "avatar")
        arrayPersons.append(newPerson)

        // Сортируем массив по дате обновления (новые элементы впереди)
        arrayPersons.sort { $0.updateDate > $1.updateDate }

        // Перезагрузка таблицы
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
   
       
    
    
    @IBAction func addPerson(_ sender: Any) {
        //        arrayNames.append("new name")
        //        arraySurname.append("new surname")
        //        arrayImage.append("avatar")
        //
       arrayPersons.append( Person(name: "new name", surname: "new surname", imagename: "avatar"))
        
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        let labelSurname = cell.viewWithTag(1000) as! UILabel
        labelSurname.text = arrayPersons[indexPath.row].surname
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arrayPersons[indexPath.row].name
        
        
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(identifier: "detailViewController") as! ViewController
        
        //        detailVc.name = arrayPersons[indexPath.row].name
        //        detailVc.surname = arrayPersons[indexPath.row].surname
        //        detailVc.imagename = arrayPersons[indexPath.row].imagename
        //
       // detailVc.person = arrayPerson[indexPath.row]
        
        
        navigationController?.show(detailVc, sender: self)
    }
    /*
     
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

         // Configure the cell...
         let labelSurname = cell.viewWithTag(1000) as! UILabel
         labelSurname.text = arrayPersons[indexPath.row].surname

         let label = cell.viewWithTag(1001) as! UILabel
         label.text = arrayPersons[indexPath.row].name

         let imageview = cell.viewWithTag(1002) as! UIImageView
         imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)

         // Отображение даты обновления
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
         let dateString = dateFormatter.string(from: arrayPersons[indexPath.row].updateDate)

         let dateLabel = cell.viewWithTag(1003) as! UILabel
         dateLabel.text = "Обновлено: \(dateString)"

         return cell
     }

     // Override to support conditional editing of the table view.
     
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            //            arrayNames.remove(at: indexPath.row)
            //            arraySurname.remove(at: indexPath.row)
            //            arrayImage.remove(at: indexPath.row)
            
            arrayPersons.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}
