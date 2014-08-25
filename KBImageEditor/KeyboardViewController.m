//
//  KeyboardViewController.m
//  KBImageEditor
//
//  Created by KUROKIYUKI on 2014/08/16.
//  Copyright (c) 2014年 KUROKIYUKI. All rights reserved.
//

#import "KeyboardViewController.h"
#import "MyKeyboard.h"
#import "KeySheet.h"

@interface KeyboardViewController ()
//@property (nonatomic, strong) UIButton *nextKeyboardButton;
@property (strong,nonatomic) MyKeyboard *mykeyboard;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    // Add custom view sizing constraints here
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mykeyboard = [[[NSBundle mainBundle] loadNibNamed:@"MyKeyboard" owner:nil options:nil] objectAtIndex:0];
    [self addGesturesToKeyboard];
    self.inputView = self.mykeyboard;
    
    
    // Perform custom UI setup here
    /*
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    NSLayoutConstraint *nextKeyboardButtonLeftSideConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *nextKeyboardButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:self.nextKeyboardButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    [self.view addConstraints:@[nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint]];
    */
}

- (void)customKeyBtnTapped:(UIButton *)sender {
    [self.textDocumentProxy insertText:@"https://twitter.com/shu223"];
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
    //[self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}

#pragma mark Keyboards
-(void)addGesturesToKeyboard{
    [self.mykeyboard.deleteKey addTarget:self action:@selector(pressDeleteKey) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.returnKey addTarget:self action:@selector(pressReturnKey) forControlEvents:UIControlEventTouchUpInside];
    
    //キーボードきりかえ
    [self.mykeyboard.globeKey addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
    
    for (UIButton *key in self.mykeyboard.KeysArray) {
        [key addTarget:self action:@selector(pressKey:) forControlEvents:UIControlEventTouchUpInside];
    }

    //テスト用ボタン
    [self.mykeyboard.changeKey addTarget:self action:@selector(pressChangeKey) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pressDeleteKey {
    [self.textDocumentProxy deleteBackward];
}

-(void)pressReturnKey {
    [self.textDocumentProxy insertText:@"\n"];
}

-(void)pressKey:(UIButton *)key {
    [self.textDocumentProxy insertText:[key currentTitle]];
}

-(void)pressChangeKey {
    KeySheet *subView = [[KeySheet alloc] init];
    [subView.SheetBtn addTarget:self action:@selector(pressSheetBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.mykeyboard.changeView addSubview:subView];
}

-(void)pressSheetBtn {
    [self.textDocumentProxy insertText:@"success!!!"];
}

@end
