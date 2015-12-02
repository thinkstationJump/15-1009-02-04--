//
//  KeyboardViewController.m
//  test-自定义键盘-Extension
//
//  Created by xiaomage on 15/10/9.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
@property (nonatomic, strong) UIButton *nextKeyboardButton;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 在模拟器->设置->general->keyboard->keyboards->addNowKeyboard
    // 可以先删除其它的键盘,只留我们自定义的
    [self testnextKeyboardButton];
    
    [self testAddBtnsOnKeyboard];
    
}

- (void)testAddBtnsOnKeyboard {
    // 1.
    for (int i = 0; i ++; i = 9) {
        // 以九宫格布局添加10个按钮
    }
    
    UIButton *inputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    inputBtn.frame = CGRectMake(0, 0, 222, 111);
    [inputBtn setTitle:@"xmgbtn" forState:UIControlStateNormal];
    [inputBtn addTarget:self action:@selector(btnSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:inputBtn];
}

- (void)btnSelected:(UIButton *)btn
{
    [self.textDocumentProxy insertText:btn.currentTitle];
}

- (void)testnextKeyboardButton {
    // Perform custom UI setup here
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    // 设置按钮的标题
    // 国际化的设置方法
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    // 按钮根据文字的长度自适应
    [self.nextKeyboardButton sizeToFit];
    // 手动设置autolayout代码的时候必须设置的一个属性
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    // 添加按钮的响应事件
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    // 将按钮添加到view上
    [self.view addSubview:self.nextKeyboardButton];
    
    // 这一片代码是设置它的约束
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

@end
