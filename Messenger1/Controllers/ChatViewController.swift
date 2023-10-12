//
//  ChatViewController.swift
//  Messenger1
//
//  Created by Chris on 10/7/23.
//

import UIKit
import MessageKit

struct Message: MessageType {
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

struct Sender: SenderType {
    var photoURL: String
    var senderId: String
    var displayName: String
}

class ChatViewController: MessagesViewController {
    
    //Properties:
    private var messages = [Message]()
    private let selfSender = Sender(photoURL: "", senderId: "1", displayName: "Jose Perez")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mocked messages for testing:
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello, I'm the sender")))
        messages.append(Message(sender: selfSender, messageId: "1", sentDate: Date(), kind: .text("Hello, I'm the receiver")))
        
        view.backgroundColor = .blue
        
        //Delegates:
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        messagesCollectionView.reloadData()
        
        //This functions can be also be used to bring the bubbles up on the viewController:
        //loadFirstMessages()
        
    }
    
    //This function allows the message bubbles to come up on the viewController, otherwise they cannot be seen.
    func loadFirstMessages() {
        DispatchQueue.main.async {
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToLastItem(animated: false)
        }
    }
}

extension ChatViewController: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    var currentSender: MessageKit.SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}
