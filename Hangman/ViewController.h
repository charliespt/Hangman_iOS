//
//  ViewController.h
//  Hangman
//
//  Created by Charlie on 2/27/14.
//  Copyright (c) 2014 Charlie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanGame.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate> {
    HangmanGame* hangmanGame;
}


@end
