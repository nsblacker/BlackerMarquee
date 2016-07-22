//
//  MarqueeView.m
//  MultiScreen
//
//  Created by NaQiang_iMac on 16/7/22.
//  Copyright © 2016年 ningxc. All rights reserved.
//

#import "MarqueeView.h"
#import "UILabel+Extend.h"

@implementation MarqueeView
-(instancetype)initWithFrame:(CGRect)frame
                     message:(NSString*)msgText
                        font:(UIFont*)msgFont
                       color:(UIColor*)msgColor{

    self = [super initWithFrame:frame];
    if(self){
        
        NSLog(@"MarqueeView Construtor");
        CGFloat viewHeight = frame.size.height;
        CGFloat viewWidth = frame.size.width;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        
        _myMessage = msgText;
    
        //current label
        _myLabel = [[UILabel alloc]init];
        _myLabel.font = msgFont;
        _myLabel.text = msgText;
        _myLabel.textColor = msgColor;
        _myLabel.backgroundColor = [UIColor clearColor];
        [_myLabel sizeToFit];
        CGFloat labelWidth = [_myLabel contentSize].width;
        CGFloat labelHeight = [_myLabel contentSize].height;
 
        CGRect currentFrame = CGRectMake((viewWidth - labelWidth)/2, (viewHeight - labelHeight)/2, labelWidth, labelHeight);
        CGRect behindFrame = CGRectZero;
        
        [_myLabel setFrame:currentFrame];
        [self addSubview:_myLabel];
        
        //behind label
        if(labelWidth > viewWidth){
            currentFrame = CGRectMake(0, (viewHeight - labelHeight)/2, labelWidth, labelHeight);
            [_myLabel setFrame:currentFrame];
            
            behindFrame = CGRectMake(currentFrame.origin.x + currentFrame.size.width, (viewHeight - labelHeight)/2, labelWidth, labelHeight);
            _myLabelBehind = [[UILabel alloc]init];
            _myLabelBehind.font = msgFont;
            _myLabelBehind.text = msgText;
            _myLabelBehind.textColor = msgColor;
            _myLabelBehind.backgroundColor = [UIColor clearColor];
            [_myLabelBehind sizeToFit];
            [_myLabelBehind setFrame:behindFrame];
            [self addSubview:_myLabelBehind];
            
            [UIView animateWithDuration:10.0f delay:2.0
                                options:UIViewAnimationOptionRepeat|UIViewAnimationOptionCurveLinear
                             animations:^{
                                 
                                 CGFloat trans = behindFrame.origin.x;
                                 CGRect frame1 = _myLabel.frame;
                                 CGRect frame2 = _myLabelBehind.frame;
                                 frame1.origin.x -= trans;
                                 frame2.origin.x -= trans;
                                 
                                 _myLabel.frame = frame1;
                                 _myLabelBehind.frame = frame2;
                                 
                             } completion:^(BOOL finished){
                                 
                             }];
        }
        
        
        
    }
    return  self;
}

-(void)doAnimation{

}



//useless
-(void)useSystemAnimation{
    
    [UIView beginAnimations:@"Marquee" context:NULL];
    [UIView setAnimationDuration:20.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:10000];
    
    CGRect frame0 = _myLabel.frame;
    frame0.origin.x = -frame0.size.width;
    _myLabel.frame = frame0;
    
    [UIView commitAnimations];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
}


@end
