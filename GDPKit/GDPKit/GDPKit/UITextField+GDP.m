//
//  UITextField+GDP.m
//  HaiPai
//
//  Created by solin on 2019/8/29.
//  Copyright © 2019 solin. All rights reserved.
//

#import "UITextField+GDP.h"

@implementation UITextField (GDP)

- (void)addPlaceholderColor:(UIColor *)color {
    NSMutableAttributedString *placeHolderStr = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
    NSDictionary *attrDic = @{
        @"NSFontAttributeName":[UIFont systemFontOfSize:15],
        @"NSForegroundColorAttributeName":color
    };
    [placeHolderStr addAttributes:attrDic range:NSMakeRange(0, self.placeholder.length)];
    self.attributedPlaceholder = placeHolderStr;
}

@end
