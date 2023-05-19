//
//  TableViewController.swift
//  tableviewFilms
//
//  Created by Александра Иванова on 09.05.2023.
//

import UIKit

class TableViewController: UITableViewController {

    //var arrayFilms = ["Harry Potter", "The last of us", "Titanic", "Avatar"]
    //var arrayAuthor = ["Rouling", "Jacob", "James Kazmeron", "Kameron"]
    //var arrayImage = ["harry","the last of us", "titanic", "avatar"]
    
    var arrayPersons = [Person(films: "Harry Potter", author: "Rouling", imagename: "harry"), Person(films: "The last of us", author: "Jacob", imagename: "the last of us"), Person(films: "Titanic", author: "James Cameron", imagename: "titanic"), Person(films: "Avatar", author: "Kameron", imagename: "avatar")]
                               
        
        override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func addPerson(_ sender: Any) {
   //     arrayFilms.append("new film")
     //   arrayAuthor.append("new author")
       // arrayImage.append("avatar2")
        arrayPersons.append(Person(films: "new film", author: "new author",imagename: "avatar2"))
        tableView.reloadData()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)

        // Configure the cell...
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = arrayPersons[indexPath.row].films
       
        let labelAuthor = cell.viewWithTag(1001) as! UILabel
        labelAuthor.text = arrayPersons[indexPath.row].author
       
        let imageview = cell.viewWithTag(1002) as! UIImageView
        imageview.image = UIImage(named: arrayPersons[indexPath.row].imagename)
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.film = arrayPersons[indexPath.row].films
        detailVc.author = arrayPersons[indexPath.row].author
        detailVc.imagename = arrayPersons[indexPath.row].imagename
        navigationController?.show(detailVc, sender: self)
    }
    /*
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
