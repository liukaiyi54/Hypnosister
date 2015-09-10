//
//  HypnosisterView.m
//  Hypnosister
//
//  Created by Michael on 9/9/15.
//  Copyright (c) 2015 Michael. All rights reserved.
//

#import "HypnosisterView.h"

@implementation HypnosisterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    
    float radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
    path.lineWidth = 10;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];
    
}


@end
