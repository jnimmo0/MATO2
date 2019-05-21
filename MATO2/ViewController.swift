//
//  ViewController.swift
//  MATO2
//
//  Created by Joshua Nimmo 2020 on 5/7/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var board:[Int]=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    let placer:[Int]=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    var cboard:[UIView]=[]
    var count=0
    var num=0.0
    var me:Robot!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var cplacer=placer
        while cplacer.count != 0{
            let index=(Int)(arc4random_uniform(UInt32(board.count)))
            if(board[index]==0){
                board[index]=cplacer.remove(at: 0)
            }
        }
        for x in board{
            let v1=UIView(frame: CGRect(x: 100+(50*(count%4)), y:200+(50*(count/4)), width: 50, height: 50))
            let shade = 1-(CGFloat)(x)/16
            v1.backgroundColor=UIColor(red: shade, green:  shade, blue:  shade, alpha: 1)
            view.addSubview(v1)
            cboard.append(v1)
            count+=1
        }
         me=Robot()
        
       
    }
    @IBAction func plz(_ sender: Any) {
       
         playSequence()
       
    }
    public func solve(_ b:[Int],_ c:[UIView]){
        board=b
        cboard=c
        while board != [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,0]{
            playSequence()
        }
    }
    public func playSequence(){
        Sequences.setOBoard(board)
        num=0
        var count=0
        var selected=(Int)(arc4random_uniform(15))
        var zero=0
        while selected == board[selected]-1{
            selected=(Int)(arc4random_uniform(14))
        }
        while count<board.count {
            if(board[count]==0){
                zero=count
                
                count=16
            }
            count+=1
        }
        var hold=check4Sequences(selected, zero)
        board=hold.1
        cboard=hold.2
        if(!hold.0){
            while board[selected]-1 != selected{
                zero=move(zero)
                
            }
            Sequences.finish(board)
            
        }
        
    }
    public func move(_ ozero:Int)->Int{
        var ad:[Int]=[]
        var zero=ozero
        if zero>=4{
            ad.append(1)
        }
        if(zero<12){
            ad.append(2)
        }
        if zero%4 != 0{
            ad.append(3)
        }
        if zero%4 != 3{
            ad.append(4)
        }
        let pick=ad[(Int)(arc4random_uniform(UInt32(ad.count)))]
        if(pick==1){
            //UIView.animate(withDuration: 0.5, animations: {self.cboard[zero-4].frame.origin.y+=50})
            UIView.animate(withDuration: 0.01, delay: 0.01*num, options: .curveLinear , animations: {self.cboard[zero-4].frame.origin.y+=50}, completion: nil)
            board[zero]=board[zero-4]
            board[zero-4]=0
            cboard[zero]=cboard[zero-4]
            zero-=4
             cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==2){
           // UIView.animate(withDuration: 0.5, animations: {self.cboard[zero+4].frame.origin.y-=50})
            UIView.animate(withDuration: 0.01, delay: 0.01*num, options: .curveLinear , animations: {self.cboard[zero+4].frame.origin.y-=50}, completion: nil)
            board[zero]=board[zero+4]
            board[zero+4]=0
            cboard[zero]=cboard[zero+4]
            zero+=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==3){
           // UIView.animate(withDuration: 0.5, animations: {self.cboard[zero-1].frame.origin.x+=50})
            UIView.animate(withDuration: 0.01, delay: 0.01*num, options: .curveLinear , animations: {self.cboard[zero-1].frame.origin.x+=50}, completion: nil)
            board[zero]=board[zero-1]
            board[zero-1]=0
            cboard[zero]=cboard[zero-1]
            zero-=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==4){
           // UIView.animate(withDuration: 0.5, animations: {self.cboard[zero+1].frame.origin.x-=50})
             UIView.animate(withDuration: 0.01, delay: 0.01*num, options: .curveLinear , animations: {self.cboard[zero+1].frame.origin.x-=50}, completion: nil)
            board[zero]=board[zero+1]
            board[zero+1]=0
            cboard[zero]=cboard[zero+1]
            zero+=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        num+=1
        Sequences.addMoves(pick)
        return zero
    }
   
    @IBAction func sequenceFast(_ sender: UIButton) {
        Sequences.setOBoard(board)
        num=0
        var count=0
        var selected=(Int)(arc4random_uniform(15))
        
        var zero=0
        while selected == board[selected]-1{
            selected=(Int)(arc4random_uniform(14))
        }
        while count<board.count {
            if(board[count]==0){
                zero=count
                
                count=16
            }
            count+=1
        }
        var hold=check4Sequencesfast(selected, zero)
        board=hold.1
        cboard=hold.2
        if(!hold.0){
            while board[selected]-1 != selected{
                zero=moveFast(zero)
                
            }
            Sequences.finish(board)
            
        }
        
    }
    public func moveFast(_ ozero:Int)->Int{
        var ad:[Int]=[]
        var zero=ozero
        if zero>=4{
            ad.append(1)
        }
        if(zero<12){
            ad.append(2)
        }
        if zero%4 != 0{
            ad.append(3)
        }
        if zero%4 != 3{
            ad.append(4)
        }
        let pick=ad[(Int)(arc4random_uniform(UInt32(ad.count)))]
        if(pick==1){
            UIView.animate(withDuration: 0.5, animations: {self.cboard[zero-4].frame.origin.y+=50})
           
            board[zero]=board[zero-4]
            board[zero-4]=0
            cboard[zero]=cboard[zero-4]
            zero-=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==2){
             UIView.animate(withDuration: 0.5, animations: {self.cboard[zero+4].frame.origin.y-=50})
           
            board[zero]=board[zero+4]
            board[zero+4]=0
            cboard[zero]=cboard[zero+4]
            zero+=4
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==3){
             UIView.animate(withDuration: 0.5, animations: {self.cboard[zero-1].frame.origin.x+=50})
            
            board[zero]=board[zero-1]
            board[zero-1]=0
            cboard[zero]=cboard[zero-1]
            zero-=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        if(pick==4){
            UIView.animate(withDuration: 0.5, animations: {self.cboard[zero+1].frame.origin.x-=50})
            
            board[zero]=board[zero+1]
            board[zero+1]=0
            cboard[zero]=cboard[zero+1]
            zero+=1
            cboard[zero]=UIView(frame: CGRect(x: 100+(50*(zero%4)), y:200+(50*(zero/4)), width: 50, height: 50))
            
        }
        num+=1
        Sequences.addMoves(pick)
        return zero
    }
   
    public func check4Sequences(_ target:Int,_ zi:Int)->(Bool,[Int],[UIView]){
        let oindex=board.lastIndex(of: target)
        let sx=oindex!%4
        let sy=oindex!/4
        let ix=target%4
        let iy=target/4
        let zix=zi%4
        let ziy=zi/4
        let id=(String)(sx)+(String)(sy)+(String)(ix)+(String)(iy)+(String)(zix)+(String)(ziy)
        for x in Sequences.sequences{
            if(id==x.id) &&  (arc4random_uniform(4) != 1){
                print("Sequence used")
                var hold=x.replay(board, zi, cboard)
                return (true,hold.0,hold.1)
            }
        }
        return (false,board,cboard)
    }
    public func check4Sequencesfast(_ target:Int,_ zi:Int)->(Bool,[Int],[UIView]){
        let oindex=board.lastIndex(of: target)
        let sx=oindex!%4
        let sy=oindex!/4
        let ix=target%4
        let iy=target/4
        let zix=zi%4
        let ziy=zi/4
        let id=(String)(sx)+(String)(sy)+(String)(ix)+(String)(iy)+(String)(zix)+(String)(ziy)
        for x in Sequences.sequences{
            if(id==x.id) &&  (arc4random_uniform(4) != 1){
                print("Sequence used")
                var hold=x.replayfast(board, zi, cboard)
                return (true,hold.0,hold.1)
            }
        }
        return (false,board,cboard)
    }
}

