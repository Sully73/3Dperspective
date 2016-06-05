//: Playground - noun: a place where people can play

import UIKit

//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


let containerView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 667.0, height: 375.0))
containerView.backgroundColor = UIColor.grayColor()
XCPlaygroundPage.currentPage.liveView = containerView

let green = UIColor.greenColor()
let blue = UIColor.blueColor()
let red = UIColor.redColor()
let purple = UIColor.purpleColor()
let yellow = UIColor.yellowColor()
let orange = UIColor.orangeColor()


var perspective = CATransform3DIdentity
perspective.m34 = -1.0/250
containerView.layer.sublayerTransform = perspective

let cubeView1 = CubeView(frontColor: green, backColor: blue, topColor: red, rightColor: purple, bottomColor: yellow, leftColor: orange)
cubeView1.frame = CGRectMake(50, 50, 100, 100)
let innerContainerView = UIView(frame: CGRectMake(0, 100, 200, 200))
innerContainerView.backgroundColor = UIColor.lightGrayColor()
containerView.addSubview(innerContainerView)
innerContainerView.addSubview(cubeView1)


let cubeView2 = CubeView(frontColor: green, backColor: blue, topColor: red, rightColor: purple, bottomColor: yellow, leftColor: orange)
cubeView2.frame = CGRectMake(400, 200, 100, 100)
containerView.addSubview(cubeView2)


