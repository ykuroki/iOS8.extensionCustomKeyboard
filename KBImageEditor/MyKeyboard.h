//
//  MyKeyboard.h
//  KBEditor
//
//  Created by KUROKIYUKI on 2014/08/16.
//  Copyright (c) 2014年 KUROKIYUKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyKeyboard : UIView

@property (weak, nonatomic) IBOutlet UIButton *deleteKey;
@property (weak, nonatomic) IBOutlet UIButton *globeKey;
@property (weak, nonatomic) IBOutlet UIButton *spaceKey;
@property (weak, nonatomic) IBOutlet UIButton *returnKey;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *KeysArray;


@property (weak, nonatomic) IBOutlet UIButton *changeKey;
@property (weak, nonatomic) IBOutlet UIView *changeView;



@end
