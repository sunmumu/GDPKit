//
//  ViewController.m
//  GDPKit
//
//  Created by sunmumu on 2018/5/24.
//  Copyright © 2018年 sunmumu. All rights reserved.
//

#import "ViewController.h"
#import "GDPKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"hua"];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    NSString *version = [NSString appVersion];
    NSLog(@"app的版本号是%@", version);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
