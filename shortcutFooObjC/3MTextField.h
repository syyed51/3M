//
//  3MTextField.h
//  
//
//  Created by Zain Syed on 30/11/2015.
//
//

#import <Cocoa/Cocoa.h>
#import "InputObj.h"
@interface _MTextField : NSTextField<NSTextFieldDelegate>
@property(nonatomic, retain) InputObj *input;
@property(nonatomic, assign) NSUInteger objectStrength;


-(void)processInput:(InputObj*)input;
@end
