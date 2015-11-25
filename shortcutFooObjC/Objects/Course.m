//
//  Course.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "Course.h"

@implementation Course
-(instancetype)init{
    self = [super init];
    if (self) {
        _title = [NSString string];
        _detail = [NSString string];
        _identifier = [[NSNumber alloc]init];
        _coursefilename = [NSString string];
    }
    return self;
}
@end
