//
//  ChatRoomTableViewController.swift
//  FirebaseChat
//
//  Created by Bobby Keffury on 12/6/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class ChatRoomTableViewController: UITableViewController {

    // MARK: - Properties
    
    let chatRoomController = ChatRoomController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var chatRoomTitleTextField: UITextField!
    
    // MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        chatRoomController.fetchChatRooms()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatRoomController.chatRooms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatRoomCell", for: indexPath)
        
        cell.textLabel?.text = chatRoomController.chatRooms[indexPath.row].title
        cell.detailTextLabel?.text = "\(chatRoomController.chatRooms[indexPath.row].messages.count) Messages"
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let detailVC = segue.destination as? ChatMessagesViewController else { return }
            detailVC.chatRoomController = chatRoomController
            detailVC.chatRoom = chatRoomController.chatRooms[indexPath.item]
        }
    }

}