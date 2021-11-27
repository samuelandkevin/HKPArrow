//
//  HKPArrow.swift
//  HKPArrow
//
//  Created by huangkunpeng on 2021/11/27.
//

import UIKit

class  HKPArrow : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState ()
        
        let contourPath = CGMutablePath()
        
        
        let x = 40
        let y = 100
        let arrowWidth = 20
        let arrowHeight = 20
        let cornerRadius:CGFloat = 10
        let bubbleFrame = CGRect(x: 0, y: 0, width: 200, height: 80)
        contourPath.move(to: CGPoint(x: x, y: y))
        
        
        contourPath.addLine(to: CGPoint(x: x - arrowWidth / 2, y: y + (-1) * arrowHeight))
        
        drawBubbleBottomShape(bubbleFrame, cornerRadius: cornerRadius, path: contourPath)
        
        contourPath.addLine(to: CGPoint(x: x + arrowWidth / 2, y: y +  (-1) * arrowHeight))
        
        contourPath.closeSubpath()
        context.addPath(contourPath)
        context.clip()
        paintBubble(context)
        
        
        
        drawBorder(contourPath, context: context)
        context.restoreGState()
    }
    
    fileprivate func paintBubble(_ context: CGContext) {
        context.setFillColor(UIColor.yellow.cgColor)
        context.fill(bounds)
    }
    
    fileprivate func drawBorder(_ borderPath: CGPath, context: CGContext) {
        context.addPath(borderPath)
        context.setStrokeColor(UIColor.orange.cgColor)
        context.setLineWidth(2)
        context.strokePath()
    }
    
    fileprivate func drawBubbleBottomShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
    }
    
    fileprivate func drawBubbleTopShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y:  frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    }
    
    fileprivate func drawBubbleRightShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.height), radius: cornerRadius)
        
    }
    
    fileprivate func drawBubbleLeftShape(_ frame: CGRect, cornerRadius: CGFloat, path: CGMutablePath) {
        
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y), tangent2End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x + frame.width, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y + frame.height), radius: cornerRadius)
        path.addArc(tangent1End: CGPoint(x: frame.x, y: frame.y + frame.height), tangent2End: CGPoint(x: frame.x, y: frame.y), radius: cornerRadius)
    }
}









extension CGRect {
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.origin.y
        }
        
        set {
            self.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.size.width
        }
        
        set {
            self.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.size.height
        }
        
        set{
            self.size.height = newValue
        }
    }
    
    var maxX: CGFloat {
        return self.maxX
    }
    
    var maxY: CGFloat {
        return self.maxY
    }
    
    var center: CGPoint {
        return CGPoint(x: self.x + self.width / 2, y: self.y + self.height / 2)
    }
}
