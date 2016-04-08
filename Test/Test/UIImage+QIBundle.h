//
//  UIImage+QIBundle.h
//  Test
//
//  Created by Xerses on 16/4/8.
//  Copyright © 2016年 loginSin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  两组API均支持另种bundle：
 *  1.用户自己创建的bundle(将包含图片资源的文件夹添加一个.bundle后缀，图片素材路径在XX.bundle/中)
 *  2.系统生成的bundle(图片素材在XX.bundle/Contents/Resources/中)
 */

@interface UIImage (QIBundle)

/**
 *  设置bundle，之后的图片都将从该bundle中获取
 *  @discussion 如果要使用该类扩展的方法，该方法必须第一个调用，否则将无法正常获取图片
 *
 *  @param bundleName bundle名
 */
+ (void)bundleWithName:(NSString *)bundleName;

/**
 *  从bundle获取图片,如果图片名中没有后缀，默认加载png图片
 *
 *  @param name 图片名
 *
 *  @return UIImage对象
 */
+ (UIImage *)imageForName:(NSString *)name;
/**
 *  从bundle获取图片
 *
 *  @param name 图片名
 *  @param type 图片类型
 *
 *  @return UIImage对象
 */
+ (UIImage *)imageForName:(NSString *)name andType:(NSString *)type;
@end

@interface UIImage (QIBundleExtention)
/**
 *  从bundle获取图片,如果图片名中没有后缀，默认加载png图片
 *
 *  @param name 图片名
 *
 *  @return UIImage对象
 */
+ (UIImage *)imageForName:(NSString *)name inBundle:(NSString *)bundleName;
/**
 *  从bundle获取图片
 *
 *  @param name 图片名
 *  @param type 图片类型
 *
 *  @return UIImage对象
 */
+ (UIImage *)imageForName:(NSString *)name andType:(NSString *)type  inBundle:(NSString *)bundleName;
@end
