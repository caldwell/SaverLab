//
//  SaverLabPreferences.m
//  SaverLab
//
//  Created by brian on Sat Jun 23 2001.
//  Copyright (c) 2001 __CompanyName__. All rights reserved.
//

#import "SaverLabPreferences.h"

static SaverLabPreferences *_sharedInstance = nil;

@implementation SaverLabPreferences

+(SaverLabPreferences *)sharedInstance {
  if (!_sharedInstance) {
    _sharedInstance = [[SaverLabPreferences alloc] init];
  }
  return _sharedInstance;
}

-(NSSize)defaultModuleWindowSize {
  float width  = [[NSUserDefaults standardUserDefaults] integerForKey:@"defaultWindowWidth"];
  float height = [[NSUserDefaults standardUserDefaults] integerForKey:@"defaultWindowHeight"];
  if (width<=0 || height<=0) {
    width  = 320;
    height = 240;
  }
  return NSMakeSize(width, height);
}

-(void)setDefaultModuleWindowSize:(NSSize)value {
  [[NSUserDefaults standardUserDefaults] setInteger:(int)value.width  forKey:@"defaultWindowWidth"];
  [[NSUserDefaults standardUserDefaults] setInteger:(int)value.height forKey:@"defaultWindowHeight"];
}

// internal methods to get and set boolean values using defaults
-(BOOL)booleanValueForKey:(NSString *)key defaultValue:(BOOL)def {
  id value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
  return (value) ? ([value intValue]!=0) : def;
}

-(void)setBooleanValue:(BOOL)value forKey:(NSString *)key {
  [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
}

// defaults to false
-(BOOL)showModuleListOnStartup {
  return [self booleanValueForKey:@"showListOnStartup" defaultValue:NO];
}
-(void)setShowModuleListOnStartup:(BOOL)value {
  [self setBooleanValue:value forKey:@"showListOnStartup"];
}

// defaults to true
-(BOOL)showModuleListWhenNoOpenWindows {
  return [self booleanValueForKey:@"showListWhenNoOpenWindows" defaultValue:YES];
}
-(void)setShowModuleListWhenNoOpenWindows:(BOOL)value {
  [self setBooleanValue:value forKey:@"showListWhenNoOpenWindows"];
}

// defaults to true
-(BOOL)restoreModuleWindowsOnStartup {
  return [self booleanValueForKey:@"restoreWindowsOnStartup" defaultValue:YES];
}
-(void)setRestoreModuleWindowsOnStartup:(BOOL)value {
  [self setBooleanValue:value forKey:@"restoreWindowsOnStartup"];
}

// defaults to true
-(BOOL)autoUpdateModuleList {
  return [self booleanValueForKey:@"autoUpdateModuleList" defaultValue:YES];
}
-(void)setAutoUpdateModuleList:(BOOL)value {
  [self setBooleanValue:value forKey:@"autoUpdateModuleList"];
}

// defaults to true
-(BOOL)showConsoleWindowOnOutput {
  return [self booleanValueForKey:@"showConsoleWindowOnOutput" defaultValue:YES];
}
-(void)setShowConsoleWindowOnOutput:(BOOL)value {
  [self setBooleanValue:value forKey:@"showConsoleWindowOnOutput"];
}


// defaults to false
-(BOOL)isPreviewVisible {
  return [self booleanValueForKey:@"isPreviewVisible" defaultValue:NO];
}
-(void)setIsPreviewVisible:(BOOL)value {
  [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"isPreviewVisible"];
}

// defaults to true
-(BOOL)createMovieFromRecordedImages {
  return [self booleanValueForKey:@"createMovie" defaultValue:YES];
}
-(void)setCreateMovieFromRecordedImages:(BOOL)value {
  [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"createMovie"];
}

// defaults to true
-(BOOL)deleteRecordedImages {
  return [self booleanValueForKey:@"deleteRecordedImages" defaultValue:YES];
}
-(void)setDeleteRecordedImages:(BOOL)value {
  [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"deleteRecordedImages"];
}

// defaults to false
-(BOOL)useCustomFrameRate {
  return [self booleanValueForKey:@"useCustomFrameRate" defaultValue:NO];
}
-(void)setUseCustomFrameRate:(BOOL)value {
  [[NSUserDefaults standardUserDefaults] setBool:value forKey:@"useCustomFrameRate"];
}

// defaults to 30
-(int)customFrameRate {
  int value = [[[NSUserDefaults standardUserDefaults] objectForKey:@"customFrameRate"] intValue];
  return (value<=0) ? 30 : value;
}
-(void)setCustomFrameRate:(int)value {
  [[NSUserDefaults standardUserDefaults] setInteger:value forKey:@"customFrameRate"];
}

// defaults to NSTemporaryDirectory
-(NSString *)recordedImagesDirectory {
  NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"imagesDirectory"];
  return (value) ? value : NSHomeDirectory();
}
-(void)setRecordedImagesDirectory:(NSString *)value {
  [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"imagesDirectory"];
}



@end
