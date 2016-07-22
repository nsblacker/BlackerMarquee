//
//  MarqueeView.h
//  MultiScreen
//
//  Created by NaQiang_iMac on 16/7/22.
//  Copyright © 2016年 ningxc. All rights reserved.
//
/**
 *  UILabel跑马灯效果封装
 */
#import <UIKit/UIKit.h>

@interface MarqueeView : UIView

@property(strong,nonatomic)UILabel *myLabel;
@property(strong,nonatomic)UILabel *myLabelBehind;
@property(strong,nonatomic)NSString* myMessage;



-(instancetype)initWithFrame:(CGRect)frame
                     message:(NSString*)msgText
                        font:(UIFont*)msgFont
                       color:(UIColor*)msgColor;
@end
