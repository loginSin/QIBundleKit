//
//  ViewController.m
//  Test
//
//  Created by Xerses on 16/4/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import "ViewController.h"
//#import "QIBundleHelper.h"
#import "UIImage+QIBundle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.backgroundColor = [UIColor redColor];
    
//    imageView.image = [QIBundleHelper imageForName:@"22.jpg" andType:nil];
//    imageView.image = [QIBundleHelper imageForName:@"22" andType:@"jpg"];
//    imageView.image = [QIBundleHelper imageForName:@"22.jpg"];
//    imageView.image = [QIBundleHelper imageForName:@"2.png"];
//    imageView.image = [QIBundleHelper imageForName:@"2"];
//    [UIImage configBundleWithName:@"Res.bundle"];
    
//    imageView.image = [UIImage imageForName:@"22.jpg" andType:nil];
//        imageView.image = [UIImage imageForName:@"22" andType:@"jpg"];
//        imageView.image = [UIImage imageForName:@"22.jpg"];
//        imageView.image = [UIImage imageForName:@"2.png"];
//        imageView.image = [UIImage imageForName:@"2"];
//    imageView.image = [UIImage imageForName:@"2"];
    
//    imageView.image = [UIImage imageForName:@"22.jpg" inBundle:@"Res.bundle"];
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"doc path %@",docPath);
    
    NSFileManager *manager = [NSFileManager defaultManager];
#if 0
    BOOL result;
    if([manager fileExistsAtPath:docPath isDirectory:&result]){
        if(result){
            NSLog(@"file exist");
        }
    }
#else
    if([manager fileExistsAtPath:docPath]){
        NSLog(@"file exist");
    }
#endif
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
