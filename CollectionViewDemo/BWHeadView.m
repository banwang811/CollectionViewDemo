//
//  BWHeadView.m
//  CollectionViewDemo
//
//  Created by mac on 15/11/20.
//  Copyright © 2015年 banwang. All rights reserved.
//

#import "BWHeadView.h"

@implementation BWHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor yellowColor];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:self.bounds];
        lable.text = @"eeeeee";
        lable.textColor = [UIColor redColor];
        [self addSubview:lable];
    }
    return self;
}

@end
