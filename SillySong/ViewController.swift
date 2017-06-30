//
//  ViewController.swift
//  SillySong
//
//  Created by Jack Howard on 6/29/17.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

class ViewController: UIViewController {
    // weak vs strong? have something to do with scope
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        self.nameField.autocapitalizationType = .words
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
    
    
}

func shortNameMaker(name: String) -> String {
    let name = name
    
    //    The shortened name should be all lowercase letters
    var newName = name.lowercased()
    
    let vowels : [Character] = ["a","e","i","o","u"]
    
    for char in newName.characters{
        if vowels.contains(char){
            return newName
        }
        newName.remove(at: newName.startIndex)
    }
    return newName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameMaker(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}



let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

