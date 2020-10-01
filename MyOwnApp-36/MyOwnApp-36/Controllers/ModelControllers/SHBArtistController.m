//
//  SHBArtistController.m
//  MyOwnApp-36
//
//  Created by Shean Bjoralt on 10/1/20.
//

#import "SHBArtistController.h"
#import "SHBArtist.h"

static NSString * const baseURLString = @"https://musicbrainz.org/ws/2/artist";
static NSString * const jsonExtensionString = @"json";

@implementation SHBArtistController

+ (instancetype)shared
{
    static SHBArtistController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^ {
        shared = [[SHBArtistController alloc] init];
    });
    return shared;
}

- (void)fetchArtistWithArtistName:(NSString *)searchTerm completion:(void (^)(SHBArtist * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    NSURL *finalURL = [searchURL URLByAppendingPathExtension:jsonExtensionString];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            return completion(nil);
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data");
            return completion(nil);
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing JSON: %@", error);
            return completion(nil);
        }
        
        SHBArtist *artist = [[SHBArtist alloc] initWithDictionary:topLevelDictionary];
        
        completion(artist);
        
    }]resume];
}

@end
