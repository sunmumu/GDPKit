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
    
//    [imageView addBorderLineWithTop:YES left:YES bottom:YES right:YES borderColor:[UIColor redColor] withBorderWidth:10];
    [UIView addBorderLine:imageView top:YES left:YES bottom:YES right:YES borderColor:UIColor.redColor withBorderWidth:30];
    
    [UIView addDottedLine:imageView dottedWidth:5 dottedSpacing:5 lineColor:UIColor.greenColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
