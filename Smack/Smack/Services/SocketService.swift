//
//  SocketService.swift
//  Smack
//
//  Created by mac on 2/18/18.
//  Copyright © 2018 Jonny B. All rights reserved.
//

import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    var manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    func establishConnection() {
        var socket = manager.defaultSocket
        socket.connect()
    }
    
    func closeConnection() {
        var socket = manager.defaultSocket
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        var socket = manager.defaultSocket
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        var socket = manager.defaultSocket
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channelDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, userId: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserDataService.instance
        var socket = manager.defaultSocket
        socket.emit("newMessage", messageBody, userId, channelId, user.name, user.avatarName, user.avatarColor)
        completion(true)
    }
    
    func getChatMessage(completion: @escaping (_ newMessage: Message) -> Void) {
        var socket = manager.defaultSocket
        socket.on("messageCreated") { (dataArray, ack) in
            guard let msgBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            guard let userName = dataArray[3] as? String else { return }
            guard let userAvatar = dataArray[4] as? String else { return }
            guard let userAvaterColor = dataArray[5] as? String else { return }
            guard let id = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            let newMessage = Message(message: msgBody, userName: userName, channelId: channelId, userAvatar: userAvatar, userAvatarColor: userAvaterColor, id: id, timeStamp: timeStamp)
            
            completion(newMessage)
            
        }
    }
    
    func getTypingUsers(_ completionHandler: @escaping (_ typingUsers: [String: String]) -> Void) {
        
        var socket = manager.defaultSocket
        socket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUsers = dataArray[0] as? [String: String] else { return }
            completionHandler(typingUsers)
        }
    }
    
}
