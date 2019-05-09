//
//  Robot.swift
//  MATO2
//
//  Created by Joshua Nimmo 2020 on 5/7/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import Foundation
import UIKit
public class Robot{
    public var board:[Int]=[]
    public var cboard:[UIView]=[]
    public var moves=0
    public var sequences:[sequence]=[]
    public init(){
        
    }
   
    public func solve(_ b:[Int],_ c:[UIView]){
        board=b
       cboard=c
        while board != [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]{
            playSequence()
        }
    }
    public func playSequence(){
        var count=0
        var first=0
        var zero=0
        while count<board.count{
            if(board[count] != count+1){
                first=count
                
                count=16
            }
             count+=1
        }
        count=0
        while count<board.count {
            if(board[count]==0){
                 zero=count
                
                count=16
            }
            count+=1
        }
        
        while board[first] != first+1{
            zero=move(zero)
            
        }
    }
    public func move(_ ozero:Int)->Int{
        var ad:[Int]=[]
        var zero=ozero
        if zero>=4{
            ad.append(1)
        }
       else if(zero<12){
            ad.append(2)
        }
        if zero%4 != 0{
            ad.append(3)
        }
        else if zero%4 != 3{
            ad.append(4)
        }
        let pick=ad[(Int)(arc4random_uniform(UInt32(ad.count)))]
        if(pick==1){
            UIView.animate(withDuration: 1, animations: {self.cboard[zero-4].frame.origin.y-=50})
            board[zero]=board[zero-4]
            board[zero-4]=0
            cboard[zero]=cboard[zero-4]
            zero-=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==2){
            UIView.animate(withDuration: 1, animations: {self.cboard[zero+4].frame.origin.y+=50})
            board[zero]=board[zero+4]
            board[zero+4]=0
            cboard[zero]=cboard[zero+4]
            zero+=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==3){
            UIView.animate(withDuration: 1, animations: {self.cboard[zero-1].frame.origin.x-=50})
            board[zero]=board[zero-1]
            board[zero-1]=0
            cboard[zero]=cboard[zero-1]
            zero-=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==4){
            UIView.animate(withDuration: 1, animations: {self.cboard[zero+1].frame.origin.x+=50})
            board[zero]=board[zero+1]
            board[zero+1]=0
            cboard[zero]=cboard[zero+1]
            zero+=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        moves+=1
        return zero
    }
    
    public func check4Sequences(_ board:[Int],_ target:Int,_ zi:Int){
        let oindex=board.lastIndex(of: target)
        let sx=oindex!%4
        let sy=oindex!/4
        let ix=target%4
        let iy=target/4
        let zix=zi%4
        let ziy=zi/4
        var id=(String)(sx)+(String)(sy)+(String)(ix)+(String)(iy)+(String)(zix)+(String)(ziy)
        for x in sequences{
            if(id==x.id){
                if(arc4random_uniform(10) != 5){
                    x.replay
                }
            }
        }
    }
}
