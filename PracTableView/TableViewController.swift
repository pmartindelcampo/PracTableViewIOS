//
//  TableViewController.swift
//  PracTableView
//
//  Created by XCode on 6/11/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var buttonEdit: UIBarButtonItem!
    @IBOutlet var buttonAdd: UIBarButtonItem!
    
    var provincias = ["Albacete", "Alicante/Alacant", "Almería", "Araba/Álava", "Asturias", "Ávila", "Badajoz", "Balears, Illes", "Barcelona", "Bizkaia", "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón/Castelló", "Ciudad Real", "Córdoba", "Coruña, A", "Cuenca", "Gipuzkoa", "Girona", "Granada", "Guadalajara", "Huelva", "Huesca", "Jaén", "León", "Lleida", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra", "Ourense", "Palencia", "Palmas, Las", "Pontevedra", "Rioja, La", "Salamanca", "Santa Cruz de Tenerife", "Segovia", "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia/València", "Valladolid", "Zamora", "Zaragoza", "Ceuta", "Melilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if ((UserDefaults.standard.object(forKey: "provincias")) != nil) {
            provincias = UserDefaults.standard.object(forKey: "provincias") as! [String]
        } else {
            UserDefaults.standard.set(provincias, forKey: "provincias")
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //let provincias = UserDefaults.standard.object(forKey: "provincias") as! Array<String>
        return provincias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = provincias[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            provincias.remove(at: indexPath.row)
            UserDefaults.standard.set(provincias, forKey: "provincias")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

        // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let provincia : String = provincias.remove(at: fromIndexPath.row)
        provincias.insert(provincia, at: to.row)
        UserDefaults.standard.set(provincias, forKey: "provincias")
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let d = segue.destination as! Detalle
        let pos = tableView.indexPathForSelectedRow?.row
        let provincia = provincias[pos!]
        d.provincia = provincia
    }
    
    @IBAction func toggleEdit(_ sender: UIBarButtonItem) {
        if isEditing {
            setEditing(false, animated: true)
            sender.title = "Edit"
        }
        else {
            setEditing(true, animated: true)
            sender.title = "Done"
        }
    }
    @IBAction func añadirProvincia(_ sender: Any) {
        let alert = UIAlertController(title: "Añadir provincia", message: "Introduzca una nueva provincia", preferredStyle: .alert)
        
        alert.addTextField { textField -> Void in
            textField.placeholder = "Provincia"
        }
        
        let action = UIAlertAction(title: "Añadir", style: .default, handler: { action in
            self.provincias.append(alert.textFields![0].text!)
            let arrayProvincias : [String] = self.provincias
            UserDefaults.standard.set(arrayProvincias, forKey: "provincias")
            self.tableView.reloadData()
        })
        let cancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
