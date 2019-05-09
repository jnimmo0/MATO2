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
    
public static func finish(c:[Int]){
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
            sequences.append(sequence.init(id,disturbed,nmoves,moves))
            nmoves=0
            moves=[]
            disturbed=[]
        }
    }
}

