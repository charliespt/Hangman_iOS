//
//  HangmanGame.h
//  Hangman
//
//  Created by Charlie on 2/27/14.
//  Copyright (c) 2014 Charlie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HangmanWords.h"

@interface HangmanGame : NSObject {
    HangmanWords* wordsDictionary;
    NSMutableArray* guessedWords;
}

@property NSString* current;
@property NSInteger numWrong;

- (void) reset;
- (BOOL) checkInput:(NSString*) inputChar;
- (BOOL) isGuessed:(NSString*) inputChar;
- (BOOL) isRight:(NSString*) inputChar;
- (NSString*) currentView;
- (BOOL) lost;
- (BOOL) win;
- (NSString*) answer;

@end
