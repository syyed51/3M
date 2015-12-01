//
//  InputObj.m
//  Created by Zain Syed on 01/12/2015.
//
//      This class is responsible to handle all types of input
//      And present it in a standard way, so that implementation class
//      become enable to handle all input types in general way.
#import "InputObj.h"

@implementation InputObj



-(instancetype)init{
    self = [super init];
    if (self) {
        self.inputType = kInputTypeUnknown;
    }
    return self;
}

@end
