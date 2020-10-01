//
//  SHBArtist.m
//  MyOwnApp-36
//
//  Created by Shean Bjoralt on 10/1/20.
//

#import "SHBArtist.h"

@implementation SHBArtist

- (instancetype)initWithYearBeagan:(NSString *)yearBegan yearEnded:(NSString *)yearEnded locationBegan:(NSString *)locationBegan
{
    self = [super init];
    if (self) {
        _yearBegan = yearBegan;
        _yearEnded = yearEnded;
        _locationBegan = locationBegan;
    }
    return self;
}

@end

@implementation SHBArtist (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *spanDictionary = dictionary[@"life-span"];
    NSDictionary *areaDictionary = dictionary[@"begin-area"];
    
    NSString *locationBegan = areaDictionary[@"name"];
    NSString *yearBegan = spanDictionary[@"begin"];
    NSString *yearEnded = spanDictionary[@"end"];
    
    return [self initWithYearBeagan:yearBegan yearEnded:yearEnded locationBegan:locationBegan];
}

@end
