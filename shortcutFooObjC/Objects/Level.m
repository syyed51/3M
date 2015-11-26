//
//  Level.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "Level.h"
#import "QA.h"
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
-(QA*)getRandomQuestion{
    NSUInteger idx =[_qAs count];
    return [_qAs objectAtIndex:rand()%idx];
}
@end
