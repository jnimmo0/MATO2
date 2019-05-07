//
//  ViewController.swift
//  MATO
//
//  Created by Joshua Nimmo 2020 on 5/7/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var board:[Int]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    let placer:[Int]=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cplacer=placer
        while cplacer.count != 0{
            var index=(Int)(arc4random_uniform(UInt32(board.count)))
            if(board[index]==0){
                board[index]=cplacer.remove(at: 0)
            }
        }
        for x in board{
            
        }
    }
    
    
}

