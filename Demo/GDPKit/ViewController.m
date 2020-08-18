//  Created by sunmumu

#import "ViewController.h"
#import "GDPKit.h"
#import "GDPCornerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    UIImage *image = [UIImage imageNamed:@"hua"];
    imageView.image = image;
    [GDPCornerManager setCornerOnUIRectCorner:(UIRectCornerTopLeft|UIRectCornerTopRight) conner:10 view:imageView];
    [self.view addSubview:imageView];
    
    NSString *version = [NSString getAppVersion];
    NSLog(@"app的版本号是%@", version);
    
    [imageView addBorderLineWithTop:NO left:NO bottom:YES right:NO borderColor:[UIColor blueColor] withBorderWidth:10];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
