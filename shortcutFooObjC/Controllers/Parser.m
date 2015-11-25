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

#define kTagCourses @"courses"
#define kTagTitle @"title"
#define kTagDescription @"Description"
#define kTagCourseId @"courseid"
#define kTagCourseFileName @"coursefilename"

@implementation Parser
-(NSArray*)parseCourses{
    NSDictionary *dcourses = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                     pathForResource:kFileNameCourses
                                                                     ofType:kPlist]];
    NSArray * acourses = [dcourses objectForKey:kTagCourses];
    NSMutableArray *courses = [NSMutableArray array];
    for (NSDictionary * d in acourses) {
        Course * c = [self parseCourse:d];
        [courses addObject:c];
    }
    return courses;
}
-(Course*)parseCourse:(NSDictionary*)course{
    Course * c = [[Course alloc]init];
    c.title = [course objectForKey:kTagTitle];
    c.detail = [course objectForKey:kTagDescription];
    c.coursefilename = [course objectForKey:kTagCourseFileName];
    c.identifier = [course objectForKey:kTagCourseId];
    return c;
}

-(NSArray*)parseLevelsInCourse:(Course*)course{
    NSDictionary *dlevels = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]
                                                                         pathForResource:course.coursefilename
                                                                         ofType:kPlist]];
    NSArray * alevels = [dlevels objectForKey:kTagCourses];
    
    NSMutableArray *levels = [NSMutableArray array];
    for (NSDictionary * d in alevels) {
        Course * c = [self parseCourse:d];
        [levels addObject:c];
    }
    return levels;

}

-(Level*)parseLevel:(NSDictionary*)level{
    Level * l = [[Level alloc]init];
    l.title = [level objectForKey:kTagTitle];
    l.detail = [level objectForKey:kTagDescription];
//    l.identifier = [level objectForKey:kTagCourseId];
    return l;
}
@end
