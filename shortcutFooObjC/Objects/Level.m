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
        _dAs = [NSArray array];
    }
    return self;
}
@end
