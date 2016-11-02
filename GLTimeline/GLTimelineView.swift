import Foundation
import UIKit

@IBDesignable
open class GLTimelineView : UIView {
    var xPoint = CGFloat()
    @IBInspectable open var lineColor : UIColor = UIColor.black { didSet { setNeedsDisplay() } }
    @IBInspectable open var pointRadius : CGFloat = 5.0 { didSet { setNeedsDisplay() } }
    @IBInspectable open var lineWidth : CGFloat = 1.0 { didSet { setNeedsDisplay() } }
    open var lineType : LineType = .begin { didSet { setNeedsDisplay() } }
    
    
    @IBInspectable var lineStatus : Int {
        get {
            return self.lineType.rawValue
        }
        set (index) {
            self.lineType = LineType(rawValue: index) ?? .normal
            self.setNeedsDisplay()
        }
    }
    
    override open func draw(_ rect: CGRect) {
        lineColor.set()
        xPoint = bounds.size.width / 2
        switch lineType {
        case .begin:
            pathForLine(.bottom).stroke()
            pathForPoint().fill()
            break
        case .end:
            pathForLine(.top).stroke()
            break
        case .normal:
            pathForLine(.top).stroke()
            pathForLine(.bottom).stroke()
            break
        case .onlyOne:
            pathForPoint().fill()
            break
        }
        pathForPoint().stroke()
    }
    
    open static func getTimeLineType(_ position:Int, items:Int) -> LineType {
        if items == 1 {
            return .onlyOne
        }
        if position == 0 {
            return .begin
        }
        if position + 1 == items {
            return .end
        }
        return .normal
    }
    
    func pathForLine(_ line:Line) -> UIBezierPath {
        let bezirePath = UIBezierPath()
        bezirePath.lineWidth = lineWidth
        var yOriginPoint = CGFloat()
        var yLastPoint = CGFloat()
        switch line {
        case .top:
            yLastPoint = getCenterLine() - pointRadius
            break
        case .bottom:
            yOriginPoint = getCenterLine() + pointRadius
            yLastPoint = bounds.size.height
            break
        }
        
        bezirePath.move(to: CGPoint(x: xPoint , y: yOriginPoint))
        bezirePath.addLine(to: CGPoint(x: xPoint, y: yLastPoint))
        
        bezirePath.close()
        return bezirePath
    }
    
    func getCenterLine () -> CGFloat {
        return (bounds.size.height / 2)
    }
    
    func pathForPoint() -> UIBezierPath{
        return pathForCircle(getCenterPoint(), radius: pointRadius)
    }
    
    func getCenterPoint() -> CGPoint {
        let x = bounds.size.width / 2
        let y = bounds.size.height / 2
        return CGPoint(x: x,y: y)
    }
    
    fileprivate func pathForCircle (_ midPoint: CGPoint,radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: false)
        return path
    }
}



enum Line {
    case top
    case bottom
}

enum Point {
    case first
    case other
}

public enum LineType : Int {
    case normal = 0
    case onlyOne = 1
    case end = 2
    case begin = 3
}
