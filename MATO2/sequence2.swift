//
//  sequence2.swift
//  MATO2
//
//  Created by Joshua Nimmo 2020 on 5/9/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import Foundation
public class sequence{
    var moves:[Int]=[]
    var id:String
    var nmoves:Int
    var disturbed:[Int]
    public init(_ i:String,_ d:[Int],_ n:Int,_ m:[Int]){
        moves=m
        id=i
        disturbed=d
        nmoves=n
    }
    public func replay(_ oboard: [Int],_ ozero:Int)->[Int]{
        var ad:[Int]=[]
        var zero=ozero
        var board=oboard
        for x in moves{
        let pick=x
        if(pick==1){
            board[zero]=board[zero-4]
            board[zero-4]=0            
            zero-=4
        }
        if(pick==2){
            board[zero]=board[zero+4]
            board[zero+4]=0
            zero+=4
        }
        if(pick==3){
            board[zero]=board[zero-1]
            board[zero-1]=0
            zero-=1
        }
        if(pick==4){
            board[zero]=board[zero+1]
            board[zero+1]=0
            zero+=1
        }
    }
    }
    return board
}

