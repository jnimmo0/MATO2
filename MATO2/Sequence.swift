//
//  Sequence.swift
//  MATO2
//
//  Created by Joshua Nimmo 2020 on 5/7/19.
//  Copyright © 2019 Joshua Nimmo 2020. All rights reserved.
//

import Foundation
public class Sequences{
static var moves:[Int]=[]
  static  var oBoard:[Int]=[]
   static var nmoves:Int=0
  static  var disturbed:[Int]=[]
 static   var zi=0
 static   var sequences:[sequence]=[]
    
static public func setOBoard(_ o:[Int]){
        oBoard=o
    }
    
public static func finish(_ c:[Int]){
    var toappend:[sequence]=[]
    nmoves=moves.count
        var count=0
        while count<c.count{
            if(oBoard[count]==c[count]){
                disturbed.append(1)
                
            }
            else{
                disturbed.append(0)
            }
            if(oBoard[count]==0){
                zi=count
            }
            count+=1
        }
    count=0
        while count<c.count{
            let selected=oBoard[count]
            let index=c.lastIndex(of: selected)
            let sx=count%4
            let sy=count/4
            let ix=index!%4
            let iy=index!/4
            let zix=zi%4
            let ziy=zi/4
             let id=(String)(sx)+(String)(sy)+(String)(ix)+(String)(iy)+(String)(zix)+(String)(ziy)
            if (String)(sx)+(String)(sy) != (String)(ix)+(String)(iy){
            toappend.append(sequence.init(id,disturbed,nmoves,moves))
            }
            count+=1
            
        }
    print(nmoves)
    purge(toappend)
    nmoves=0
    moves=[]
    disturbed=[]
   
    }
    public static func addMoves(_ m:Int){
    moves.append(m)
}
    public static func purge(_ oa:[sequence]){
        var count=0
        var count2=0
        var a=oa
        while count<a.count {
            if a[count].nmoves>1000{
                a.remove(at: count)
                count-=1
            }
            count+=1
        }
        count=0
        while count<a.count{
            count2=0
            while count2<sequences.count{
                if sequences[count2].id==a[count].id{
                    if sequences[count2].nmoves>a[count].nmoves{
                        sequences.remove(at: count2)
                        
                    }
                    else{
                        a.remove(at: count)
                    }
                    count2=sequences.count
                }
                count2+=1
            }
            
            count+=1
            }
        for x in a{
            sequences.append(x)
        }
        print("Number of sequeces:"+(String)(sequences.count))
    }
}
