//
//  UIImage+QIBundle.m
//  Test
//
//  Created by Xerses on 16/4/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import "UIImage+QIBundle.h"

static NSString *systemBundlePathKey = @"/Contents/Resources/";

@implementation UIImage (QIBundleExtention)
//从bundle获取图片,如果图片名中没有后缀，默认加载png图片
+ (UIImage *)imageForName:(NSString *)name inBundle:(NSString *)bundleName {
    return [self imageForName:name andType:nil inBundle:bundleName];
}
//从bundle获取图片
+ (UIImage *)imageForName:(NSString *)name andType:(NSString *)type inBundle:(NSString *)bundleName {
    name = [self p_checkImageName:name andType:type];
    bundleName = [self p_checkBundleName:bundleName];
    NSString *imagePath = [self p_resourceForName:name andType:type inBundle:bundleName];
    return [UIImage imageWithContentsOfFile:imagePath];
}
//获取图片素材的路径
//如果是用户自定义的bundle，路径为XX.bundle
//如果是通过系统创建的bundle，路径为XX.bundle/Contents/Resources/
+ (NSString *)p_resourceForName:(NSString *)name andType:(NSString *)type inBundle:(NSString *)bundleName{
    //此时的bundleName是完整的bundle名称，为XX.bundle
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:bundleName ofType:nil];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *tmpBundlePath = [NSString stringWithFormat:@"%@%@",bundlePath,systemBundlePathKey];
    if([manager fileExistsAtPath:tmpBundlePath]){
        bundleName = [NSString stringWithFormat:@"%@%@",bundleName,systemBundlePathKey];
    }
    return [[NSBundle mainBundle] pathForResource:name ofType:type inDirectory:bundleName];
}
//检测bundle是否以bundle为后缀，是的话直接返回bundleName，否的话追加.bundle再返回
+ (NSString *)p_checkBundleName:(NSString *)bundleName {
    if([bundleName hasSuffix:@"bundle"]){
        return bundleName;
    }
    return [NSString stringWithFormat:@"%@.bundle",bundleName];
}
//检测图片名称是否以png、jpg、jepg、bmp、gif为后缀(常见的也就这几种)
//如果有正常的后缀，直接返回，如果没有追加png再返回
+ (NSString *)p_checkImageName:(NSString *)name andType:(NSString *)type {
    if(type) {
        return name;
    }
    if([name hasSuffix:@"png"]){
        return name;
    }
    if([name hasSuffix:@"jpg"]){
        return name;
    }
    if([name hasSuffix:@"jepg"]){
        return name;
    }
    if([name hasSuffix:@"bmp"]){
        return name;
    }
    if([name hasSuffix:@"gif"]){
        return name;
    }
    return [NSString stringWithFormat:@"%@.png",name];
}

@end

static NSString *bundleNameKey = nil;

@implementation UIImage (QIBundle)

+ (void)bundleWithName:(NSString *)bundleName {
    bundleNameKey = bundleName;
}

+ (UIImage *)imageForName:(NSString *)name andType:(NSString *)type {
    return [self imageForName:name andType:type inBundle:bundleNameKey];
}

+ (UIImage *)imageForName:(NSString *)name {
    return [self imageForName:name inBundle:bundleNameKey];
}

+ (NSString *)p_resourceForName:(NSString *)name andType:(NSString *)type {
    return [self p_resourceForName:name andType:type inBundle:bundleNameKey];
}

@end

