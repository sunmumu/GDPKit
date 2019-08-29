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
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}

@end
