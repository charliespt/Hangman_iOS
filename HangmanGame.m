//
//  HangmanGame.m
//  Hangman
//
//  Created by Charlie on 2/27/14.
//  Copyright (c) 2014 Charlie. All rights reserved.
//

#import "HangmanGame.h"

@implementation HangmanGame

- (id) init
{
    self = [super init];
    if (self) {
        wordsDictionary = [[HangmanWords alloc] init];
        [self setCurrent: [wordsDictionary getWord]];
        guessedWords = [[NSMutableArray alloc] init];
        _numWrong = 0;
    }
    return self;
}

- (void) reset
{
    [self setCurrent: [wordsDictionary getWord]];
    [guessedWords removeAllObjects];
    _numWrong = 0;
}

- (BOOL) checkInput:(NSString *)inputChar
{
    if ([inputChar length] != 1) {
        return NO;
    }
    if (![[NSCharacterSet letterCharacterSet] characterIsMember:[inputChar characterAtIndex:0]])
        {
        return NO;
        }
    return YES;
}

- (BOOL) isGuessed:(NSString *)inputChar
{
    if ([guessedWords containsObject: inputChar]) {
        return YES;
    }
    return NO;
}

- (BOOL) isRight:(NSString *)inputChar
{
    NSRange textRange = [[_current lowercaseString] rangeOfString:[inputChar lowercaseString]];
    if((textRange.location != NSNotFound) ||([guessedWords containsObject:[inputChar uppercaseString]]) || (![self checkInput:inputChar]))
    {
        [guessedWords addObject:[inputChar uppercaseString]];
        return YES;
    } else
    {
        [guessedWords addObject:[inputChar uppercaseString]];
        _numWrong = _numWrong + 1;
        return NO;
    }
}

- (NSString*) currentView
{
    NSMutableString* currentShowingView = [NSMutableString stringWithString: @""];
    for (NSInteger i = 0; i < [_current length]; i++) {
        NSString* curChar = [NSString stringWithFormat: @"%C", [_current characterAtIndex:i]];
        if (![curChar isEqual: @" "]) {
            if ([guessedWords containsObject:curChar]) {
                [currentShowingView appendFormat:@"%@ " , curChar];
            }
            else {
                [currentShowingView appendString: @"_ "];
            }
        }
        else {
            [currentShowingView appendString: @"  "];
        }
    }
    
    return currentShowingView;
}


- (BOOL) lost
{
    if (_numWrong > 6) {
        return YES;
    }
    return NO;
}

- (BOOL) win
{
    /* TODO determine logic */
    if ([[self currentView] rangeOfString: @"_"].location != NSNotFound)
        return NO;
    return YES;
}

- (NSString*) answer
{
    return _current;
}


@end
