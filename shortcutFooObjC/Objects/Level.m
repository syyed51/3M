//
//  Level.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "Level.h"

@implementation Level
-(instancetype)init{
    self = [super init];
    if (self) {
        _title = [NSString string];
        _detail = [NSString string];
        _qAs = [NSArray array];
    }
    return self;
}
@end
