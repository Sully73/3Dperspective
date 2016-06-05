import UIKit

public class CubeView : UIView {
    
    private var lastFrame = CGRectZero
    
    internal let frontLayer: CALayer
    internal let backLayer: CALayer
    internal let topLayer: CALayer?
    internal let rightLayer: CALayer
    internal let bottomLayer: CALayer?
    internal let leftLayer: CALayer
    
    
public convenience init(frontColor: UIColor, backColor: UIColor, topColor: UIColor?,
                     rightColor: UIColor, bottomColor: UIColor?, leftColor: UIColor) {
        let frontLayer = CALayer()
        frontLayer.backgroundColor = frontColor.CGColor
        
        let backLayer = CALayer()
        backLayer.backgroundColor = backColor.CGColor
        
        var topLayer: CALayer?
        if let topColor = topColor {
            topLayer = CALayer()
            topLayer!.backgroundColor = topColor.CGColor
        }
        
        let rightLayer = CALayer()
        rightLayer.backgroundColor = rightColor.CGColor
        
        var bottomLayer: CALayer?
        if let bottomColor = bottomColor {
            bottomLayer = CALayer()
            bottomLayer!.backgroundColor = bottomColor.CGColor
        }
        
        let leftLayer = CALayer()
        leftLayer.backgroundColor = leftColor.CGColor
        
        self.init(frontLayer: frontLayer, backLayer: backLayer, topLayer: topLayer,
                  rightLayer: rightLayer, bottomLayer: bottomLayer, leftLayer: leftLayer)
    }
    
    
    init(frontLayer: CALayer?, backLayer: CALayer?, topLayer: CALayer?,
         rightLayer: CALayer?, bottomLayer: CALayer?, leftLayer: CALayer?) {
        self.frontLayer = frontLayer ?? CALayer()
        self.backLayer = backLayer ?? CALayer()
        self.topLayer = topLayer
        self.rightLayer = rightLayer ?? CALayer()
        self.bottomLayer = bottomLayer
        self.leftLayer = leftLayer ?? CALayer()
        
        super.init(frame: CGRectZero)
        
        self.layer.addSublayer(self.frontLayer)
        self.layer.addSublayer(self.backLayer)
        if let topLayer = self.topLayer {
            self.layer.addSublayer(topLayer)
        }
        self.layer.addSublayer(self.rightLayer)
        if let bottomLayer = self.bottomLayer {
            self.layer.addSublayer(bottomLayer)
        }
        self.layer.addSublayer(self.leftLayer)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override public class func layerClass() -> AnyClass {
        return CATransformLayer.self
    }
    
    
    ///////////////////////////////////////////////////////////////////////////////////////////////
    // MARK: -
    // MARK: UIView
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let frame = self.bounds
        if !CGRectEqualToRect(frame, self.lastFrame) {
            self.lastFrame = frame
            
            self.frontLayer.frame = frame
            self.backLayer.frame = frame
            self.topLayer?.frame = frame
            self.rightLayer.frame = frame
            self.bottomLayer?.frame = frame
            self.leftLayer.frame = frame
            
            let w = frame.size.width
            let hW = floor(w * 0.5)
            
            self.frontLayer.transform = CATransform3DMakeTranslation(0.0, 0.0, hW)
            
            self.backLayer.transform = CATransform3DConcat(CATransform3DMakeRotation(CGFloat(-M_PI), 0.0, 0.0, 1.0), CATransform3DMakeTranslation(0.0, 0.0, -hW))
            
            self.topLayer?.transform = CATransform3DConcat(
                CATransform3DMakeRotation(CGFloat(M_PI_2), 1.0, 0.0, 0.0),
                CATransform3DMakeTranslation(0.0, -hW, 0.0)
            )
            
            self.leftLayer.transform = CATransform3DConcat(
                CATransform3DMakeRotation(CGFloat(M_PI_2), 0.0, 1.0, 0.0),
                CATransform3DMakeTranslation(hW, 0.0, 0.0)
            )
            
            self.bottomLayer?.transform = CATransform3DConcat(
                CATransform3DMakeRotation(CGFloat(-M_PI_2), 1.0, 0.0, 0.0),
                CATransform3DMakeTranslation(0.0, hW, 0.0)
            )
            
            self.rightLayer.transform = CATransform3DConcat(
                CATransform3DMakeRotation(CGFloat(-M_PI_2), 0.0, 1.0, 0.0),
                CATransform3DMakeTranslation(-hW, 0.0, 0.0)
            )
        }
    }
}
