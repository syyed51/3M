//
//  Parser.m
//  
//
//  Created by Zain Syed on 25/11/2015.
//
//

#import "Parser.h"
#import "Course.h"
#import "Level.h"
#import "Question.h"

@implementation Parser
-(NSArray*)parse{
NSDictionary *dcourses = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                     pathForResource:kFileNameCourses
                                                                     ofType:kPlist]];
    
    NSArray * acourses = [dcourses objectForKey:@"ROOT"];
    NSMutableArray *courses = [NSMutableArray array];
    for (NSDictionary * d in acourses) {
        Course * c = [self parseCourse:d];
        [courses addObject:c];
    }
    return courses;
}
-(Course*)parseCourse:(NSDictionary*)course{
    Course * c = [[Course alloc]init];
    c.title = [course objectForKey:@"title"];
    c.description = [course objectForKey:@"description"];
    return c;
}

//-(NSArray*)parseLevel{}
//-(NSArray*)parseQuestion{}
@end
