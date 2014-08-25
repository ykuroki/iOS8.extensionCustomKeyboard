//
//  KeySheet.m
//  KBEditor
//
//  Created by Yuki Kuroki on 2014/08/25.
//  Copyright (c) 2014年 KUROKIYUKI. All rights reserved.
//

#import "KeySheet.h"

@implementation KeySheet

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UINib *nib = [UINib nibWithNibName:@"keyboard_1" bundle:[NSBundle mainBundle]];
        NSArray *array = [nib instantiateWithOwner:self options:nil];
        self = [array objectAtIndex:0];
    }
    return self;
}


@end
