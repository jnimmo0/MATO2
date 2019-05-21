//
//  sequence2.swift
//  MATO2
//
//  Created by Joshua Nimmo 2020 on 5/9/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import Foundation
import UIKit
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
    public func replay(_ oboard: [Int],_ ozero:Int,_ ocboard:[UIView])->([Int],[UIView]){
        var zero=ozero
        var board=oboard
        var cboard=ocboard
        print(moves.count)
        for x in moves{
        let pick=x
        if(pick==1){
            UIView.animate(withDuration: 0.01, delay: 0.01*Double(nmoves), options: .curveLinear , animations: {cboard[zero-4].frame.origin.y+=50}, completion: nil)
            board[zero]=board[zero-4]
            board[zero-4]=0
            cboard[zero]=cboard[zero-4]
            zero-=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
        }
        if(pick==2){
            UIView.animate(withDuration: 0.01, delay: 0.01*Double(nmoves), options: .curveLinear , animations: {cboard[zero+4].frame.origin.y-=50}, completion: nil)
            board[zero]=board[zero+4]
            board[zero+4]=0
            cboard[zero]=cboard[zero+4]
            zero+=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
        }
        if(pick==3){
            UIView.animate(withDuration: 0.01, delay: 0.01*Double(nmoves), options: .curveLinear , animations: {cboard[zero-1].frame.origin.x+=50}, completion: nil)
            board[zero]=board[zero-1]
            board[zero-1]=0
            cboard[zero]=cboard[zero-1]
            zero-=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
        }
        if(pick==4){
            UIView.animate(withDuration: 0.01, delay: 0.01*Double(nmoves), options: .curveLinear , animations: {cboard[zero+1].frame.origin.x-=50}, completion: nil)
            board[zero]=board[zero+1]
            board[zero+1]=0
            cboard[zero]=cboard[zero+1]
            zero+=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
        }
    }
        return (board,cboard)
    }
    public func replayfast(_ oboard: [Int],_ ozero:Int,_ ocboard:[UIView])->([Int],[UIView]){
        var zero=ozero
        var board=oboard
        var cboard=ocboard
        print(moves.count)
        for x in moves{
            let pick=x
            if(pick==1){
                UIView.animate(withDuration: 0.5, animations: {cboard[zero-4].frame.origin.y+=50})
                board[zero]=board[zero-4]
                board[zero-4]=0
                cboard[zero]=cboard[zero-4]
                zero-=4
                cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            }
            if(pick==2){
                UIView.animate(withDuration: 0.5, animations: {cboard[zero+4].frame.origin.y-=50})
                board[zero]=board[zero+4]
                board[zero+4]=0
                cboard[zero]=cboard[zero+4]
                zero+=4
                cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            }
            if(pick==3){
                UIView.animate(withDuration: 0.5, animations: {cboard[zero-1].frame.origin.x+=50})
                board[zero]=board[zero-1]
                board[zero-1]=0
                cboard[zero]=cboard[zero-1]
                zero-=1
                cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            }
            if(pick==4){
                UIView.animate(withDuration: 0.5, animations: {cboard[zero+1].frame.origin.x-=50})
                board[zero]=board[zero+1]
                board[zero+1]=0
                cboard[zero]=cboard[zero+1]
                zero+=1
                cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            }
        }
        return (board,cboard)
    }
}

