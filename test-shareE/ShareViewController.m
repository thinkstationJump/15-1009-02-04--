//
//  ShareViewController.m
//  test-shareE
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

//这个函数⽤用于判断分享内容的可⽤用性,我们在其中获取分享的内容进⾏行检查
- (BOOL)isContentValid {
    // Do validation of contentText and/or NSExtensionContext attachments here
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    return YES;
}

//点击post按钮后出发的⽅方法,我们可以在这⾥里将分享的内容进⾏行上传等操作
- (void)didSelectPost {
    // This is called after the user selects Post. Do the upload of contentText and/or NSExtensionContext attachments.
    
    // Inform the host that we're done, so it un-blocks its UI. Note: Alternatively you could call super's -didSelectPost, which will similarly complete the extension context.
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    [self.extensionContext completeRequestReturningItems:@[] completionHandler:nil];
}
// 点击cancle的适合调用
- (void)didSelectCancel
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}

//这⾥里⽤用于设置分享插件的附件按钮
- (NSArray *)configurationItems {
    // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
    
    SLComposeSheetConfigurationItem *item0 = [[SLComposeSheetConfigurationItem alloc] init];
    item0.title = @"xmgHAHA";
    item0.value = @"叶良辰";
    
    return @[item0];
}

// 弹出视图动画结束后执⾏行的⽅方法
- (void)presentationAnimationDidFinish
{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    self.placeholder = @"xmg1期 test placeholder";
}

@end
