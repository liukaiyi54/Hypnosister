//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by Michael on 9/9/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "HypnosisterView.h"

@interface HypnosisterView()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation HypnosisterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self drawCircles];
    [self drawName];
    [self drawFlower];
}

- (void)drawCircles {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    float maxRadius = hypotf(bounds.size.width, bounds.size.height) / 2.0;
    
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    }
    
    path.lineWidth = 10;
    [self.circleColor setStroke];
    [path stroke];
}

- (void)drawName {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Michael"];
    NSRange range = [[text string] rangeOfString:@"Michael"];
    
    [text addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:60],
                          NSForegroundColorAttributeName : [UIColor greenColor],
                          NSStrokeWidthAttributeName : @-3,
                          NSStrokeColorAttributeName : [UIColor redColor]} range:range];
    
    [text drawAtPoint:CGPointMake(center.x-100, center.y-30)];
}

- (void)drawFlower {
    CGSize size = self.bounds.size;
    CGFloat margin = 10;
    CGFloat radius = rintf(MIN(size.height - margin, size.width - margin) / 4);
    
    CGFloat xOffset, yOffset;
    CGFloat offset = rintf((size.height - size.width) / 2);
    if (offset > 0) {
        xOffset = rint(margin / 2);
        yOffset = offset;
    } else {
        xOffset = -offset;
        yOffset = rint(margin / 2);
    }
    
    [[UIColor redColor] setFill];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius + yOffset) radius:radius startAngle:-M_PI endAngle:0 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 3 + xOffset, radius * 2 + yOffset) radius:radius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius * 2 + xOffset, radius * 3 + yOffset) radius:radius startAngle:0 endAngle:M_PI clockwise:YES];
    [path addArcWithCenter:CGPointMake(radius + xOffset, radius * 2 + yOffset) radius:radius startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
    
    [path closePath];
    [path fill];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:0.7];
    
    self.circleColor = randomColor;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
