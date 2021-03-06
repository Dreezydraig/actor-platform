//
//  Copyright (c) 2014-2015 Actor LLC. <https://actor.im>
//

import Foundation

class Placeholders {
    
    class func avatarPlaceholder(index: jint, size: Int, title: NSString, rounded: Bool) -> UIImage {
        var color = MainAppTheme.common.placeholders[Int(abs(index)) % MainAppTheme.common.placeholders.count].CGColor;
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: size, height: size), false, UIScreen.mainScreen().scale);
        var context = UIGraphicsGetCurrentContext();
        
        // Background
        
        CGContextSetFillColorWithColor(context, color);
        
        if rounded {
            CGContextAddArc(context, CGFloat(size)/2, CGFloat(size)/2, CGFloat(size)/2, CGFloat(M_PI * 0), CGFloat(M_PI * 2), 0);
        } else {
            CGContextAddRect(context, CGRect(x: 0, y: 0, width: size, height: size))
        }
        
        CGContextDrawPath(context, kCGPathFill);
        
        // Text
        
        UIColor.whiteColor().set()
        
        var font = UIFont.systemFontOfSize(CGFloat(size / 2));
        var rect = CGRectMake(0, 0, CGFloat(size), CGFloat(size))
        rect.origin.y = round(CGFloat(size * 47 / 100) - font.pointSize / 2);
        
        var style : NSMutableParagraphStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        style.alignment = NSTextAlignment.Center
        style.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        
        title.drawInRect(rect, withAttributes: [NSParagraphStyleAttributeName:style, NSFontAttributeName:font,
            NSForegroundColorAttributeName:UIColor.whiteColor()])
        
        // Border
        
        if rounded {
            CGContextSetStrokeColorWithColor(context, UIColor(red: 0, green: 0, blue: 0, alpha: 0x10/255.0).CGColor);
            CGContextAddArc(context,CGFloat(size)/2, CGFloat(size)/2, CGFloat(size)/2, CGFloat(M_PI * 0), CGFloat(M_PI * 2), 0);
            CGContextDrawPath(context, kCGPathStroke);
        }
        
        var image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}
