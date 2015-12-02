//
//  PhotoEditingViewController.m
//  test-PhotoEditingExtension
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "PhotoEditingViewController.h"
#import <Photos/Photos.h>
#import <PhotosUI/PhotosUI.h>

@interface PhotoEditingViewController () <PHContentEditingController>
@property (strong) PHContentEditingInput *input;
@end

@implementation PhotoEditingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PHContentEditingController

- (BOOL)canHandleAdjustmentData:(PHAdjustmentData *)adjustmentData {
    // Inspect the adjustmentData to determine whether your extension can work with past edits.
    // (Typically, you use its formatIdentifier and formatVersion properties to do this.)
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    return NO;
}

//  选中图片进入到这个方法中,在此方法中拿到照片,进行相应的处理
- (void)startContentEditingWithInput:(PHContentEditingInput *)contentEditingInput placeholderImage:(UIImage *)placeholderImage {
    // Present content for editing, and keep the contentEditingInput for use when closing the edit session.
    // If you returned YES from canHandleAdjustmentData:, contentEditingInput has the original image and adjustment data.
    // If you returned NO, the contentEditingInput has past edits "baked in".
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    //我们可以在这⾥里将取到的数据进⾏行展⽰示等等
    self.input = contentEditingInput;
}
// 结束编辑照⽚片时的⽅方法,在此方法中将编辑好的照片传递出去
- (void)finishContentEditingWithCompletionHandler:(void (^)(PHContentEditingOutput *))completionHandler {
    // Update UI to reflect that editing has finished and output is being rendered.
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    
    // Render and provide output on a background queue.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Create editing output from the editing input.
        PHContentEditingOutput *output = [[PHContentEditingOutput alloc] initWithContentEditingInput:self.input];
        
        // Provide new adjustments and render output to given location.
        // output.adjustmentData = <#new adjustment data#>;
        // NSData *renderedJPEGData = <#output JPEG#>;
        // [renderedJPEGData writeToURL:output.renderedContentURL atomically:YES];
        //我们可以在这⾥里将新的图⽚片数据写⼊入到输出流中
        // Call completion handler to commit edit to Photos.
        completionHandler(output);
        
        // Clean up temporary files, etc.
    });
}


// 如果返回yes,当点击取消的时候,会多出现一个选项
- (BOOL)shouldShowCancelConfirmation {
    // Returns whether a confirmation to discard changes should be shown to the user on cancel.
    // (Typically, you should return YES if there are any unsaved changes.)
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    return YES;
}

- (void)cancelContentEditing {
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
    // Clean up temporary files, etc.
    // May be called after finishContentEditingWithCompletionHandler: while you prepare output.
}

@end
